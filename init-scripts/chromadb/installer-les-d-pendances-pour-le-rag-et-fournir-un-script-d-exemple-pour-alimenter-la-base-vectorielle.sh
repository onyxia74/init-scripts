#!/usr/bin/env bash
set -euo pipefail

# This init script prepares chromadb on Onyxia.
# Purpose: Installer les dépendances pour le RAG et fournir un script d'exemple pour alimenter la base vectorielle.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/ingest.py")"
cat > "${WORK_DIR}/ingest.py" <<'ONYXIA_FILE_f48ab14def84'
import chromadb
import os

# Connexion au serveur ChromaDB local
client = chromadb.HttpClient(host='localhost', port=8000)

# Création ou récupération d'une collection
collection = client.get_or_create_collection(name="rag_documents")

# Exemple d'ajout de documents
collection.add(
    documents=["Ceci est un document pour le RAG."],
    ids=["doc1"]
)

print("Document ajouté avec succès.")
ONYXIA_FILE_f48ab14def84
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_ae97e9f439ed'
chromadb
langchain
langchain-community
pypdf
ONYXIA_FILE_ae97e9f439ed

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install chromadb langchain langchain-community pypdf
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

