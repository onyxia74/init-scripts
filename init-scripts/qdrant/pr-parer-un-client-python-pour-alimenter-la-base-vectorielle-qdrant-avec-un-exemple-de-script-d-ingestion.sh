#!/usr/bin/env bash
set -euo pipefail

# This init script prepares qdrant on Onyxia.
# Purpose: Préparer un client Python pour alimenter la base vectorielle Qdrant avec un exemple de script d'ingestion.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/ingest.py")"
cat > "${WORK_DIR}/ingest.py" <<'ONYXIA_FILE_00ece2b44e89'
import os
from qdrant_client import QdrantClient
from qdrant_client.models import Distance, VectorParams, PointStruct
import numpy as np

# Connexion au service Qdrant local
client = QdrantClient(url="http://localhost:6333")

def create_collection(collection_name, vector_size):
    try:
        client.get_collection(collection_name)
        print(f"Collection '{collection_name}' existe déjà.")
    except Exception:
        print(f"Création de la collection '{collection_name}'...")
        client.create_collection(
            collection_name=collection_name,
            vectors_config=VectorParams(size=vector_size, distance=Distance.COSINE)
        )

def ingest_documents(collection_name, documents, vector_size=1536):
    create_collection(collection_name, vector_size)
    
    # Exemple simple : embedding aléatoire (à remplacer par un vrai modèle d'embedding)
    points = []
    for i, doc in enumerate(documents):
        vector = np.random.rand(vector_size).tolist()
        points.append(PointStruct(id=i, vector=vector, payload={"text": doc}))
        
    client.upsert(collection_name=collection_name, points=points)
    print(f"{len(documents)} documents ingestés dans '{collection_name}'.")

if __name__ == "__main__":
    docs = ["Premier document sur le RAG", "Deuxième document sur les vecteurs", "Troisième exemple"]
    ingest_documents("my_rag_collection", docs)
    print("Script terminé. Vous pouvez maintenant interroger la collection.")
ONYXIA_FILE_00ece2b44e89

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy qdrant-client langchain langchain-community

