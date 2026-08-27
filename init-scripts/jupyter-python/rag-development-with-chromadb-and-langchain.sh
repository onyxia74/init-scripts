#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: RAG development with ChromaDB and LangChain
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/rag_demo.py")"
cat > "${WORK_DIR}/rag_demo.py" <<'ONYXIA_FILE_06dfa7f9cd66'
import chromadb
from langchain_community.vectorstores import Chroma
from langchain_community.embeddings import HuggingFaceEmbeddings

# This is a skeleton to demonstrate how to connect to the ChromaDB service
# In Onyxia, the service is discoverable via environment variables or hostnames

def setup_rag():
    print('Initializing RAG client...')
    # Note: In a real scenario, you would use the service hostname provided by Onyxia discovery
    client = chromadb.HttpClient(host='chromadb', port=8000)
    
    # Create a collection
    collection = client.get_or_create_collection(name='my_knowledge_base')
    
    # Add some dummy data
    collection.add(
        documents=['Onyxia is a platform for data science.', 'RAG stands for Retrieval Augmented Generation.'],
        ids=['id1', 'id2']
    )
    print('Collection populated successfully!')

if __name__ == '__main__':
    setup_rag()
ONYXIA_FILE_06dfa7f9cd66

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install chromadb langchain langchain-community openai tiktoken sentence-transformers

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_15b0fe97d5b0'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --allow-root --no-browser
ONYXIA_FILE_15b0fe97d5b0
chmod +x "${WORK_DIR}/onyxia/run.sh"

