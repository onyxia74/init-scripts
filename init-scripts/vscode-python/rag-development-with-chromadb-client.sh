#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: RAG development with ChromaDB client
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/rag_client.py")"
cat > "${WORK_DIR}/rag_client.py" <<'ONYXIA_FILE_f0c07044ca50'
import chromadb
from chromadb.utils import embedding_functions

# Initialize ChromaDB client
client = chromadb.HttpClient(host='chromadb', port=8000)

# Create or get a collection
collection = client.get_or_create_collection(name='my_rag_collection')

# Example: Adding documents
collection.add(
    documents=["This is a document about RAG", "Vector databases are great"],
    metadatas=[{"source": "manual"}, {"source": "manual"}],
    ids=["id1", "id2"]
)

# Example: Querying
results = collection.query(
    query_texts=["What is RAG?"],
    n_results=1
)
print(results)
ONYXIA_FILE_f0c07044ca50

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install chromadb langchain openai sentence-transformers tiktoken

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_7cc53a1be563'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python rag_client.py
ONYXIA_FILE_7cc53a1be563
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Add a VSCode task for the prepared project.
mkdir -p "${WORK_DIR}/.vscode"
cat > "${WORK_DIR}/.vscode/tasks.json" <<'ONYXIA_FILE_0a74afde5062'
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run prepared project",
      "type": "shell",
      "command": "${workspaceFolder}/onyxia/run.sh",
      "problemMatcher": [],
      "group": "build"
    }
  ]
}
ONYXIA_FILE_0a74afde5062

