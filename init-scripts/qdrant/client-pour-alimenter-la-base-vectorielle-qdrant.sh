#!/usr/bin/env bash
set -euo pipefail

# This init script prepares qdrant on Onyxia.
# Purpose: client pour alimenter la base vectorielle Qdrant
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/client_rag.py")"
cat > "${WORK_DIR}/client_rag.py" <<'ONYXIA_FILE_a11a1cb316c4'
import qdrant_client
from qdrant_client import QdrantClient
from qdrant_client.http import models

# Connexion au service Qdrant
client = QdrantClient(host="localhost", port=6333)

# Création d'une collection exemple
collection_name = "my_rag_collection"
client.recreate_collection(
    collection_name=collection_name,
    vectors_config=models.VectorParams(size=1536, distance=models.Distance.COSINE),
)

print(f"Collection {collection_name} créée avec succès.")
ONYXIA_FILE_a11a1cb316c4

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install qdrant-client

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_2d82e08a6ef9'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python client_rag.py
ONYXIA_FILE_2d82e08a6ef9
chmod +x "${WORK_DIR}/onyxia/run.sh"

