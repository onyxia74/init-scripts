#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: setup rag environment with langchain and chromadb
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/rag_demo.py")"
cat > "${WORK_DIR}/rag_demo.py" <<'ONYXIA_FILE_3affe6b533ba'
import os
from langchain_community.vectorstores import Chroma
from langchain_community.embeddings import HuggingFaceEmbeddings

# Simple demo of initializing a vector store
def setup_rag():
    embeddings = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")
    texts = ["Onyxia is a data platform", "RAG stands for Retrieval Augmented Generation"]
    vectorstore = Chroma.from_texts(texts, embeddings, persist_directory="./chroma_db")
    print("Vector store created successfully!")

if __name__ == '__main__':
    setup_rag()
ONYXIA_FILE_3affe6b533ba

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install langchain langchain-community openai chromadb sentence-transformers tiktoken

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_c6fed97992d6'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python rag_demo.py
ONYXIA_FILE_c6fed97992d6
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

