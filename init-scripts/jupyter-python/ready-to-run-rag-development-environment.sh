#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: ready-to-run RAG development environment
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/rag_demo.py")"
cat > "${WORK_DIR}/rag_demo.py" <<'ONYXIA_FILE_6372a84e6f65'
import chromadb
from chromadb.utils import embedding_functions

# Initialize Chroma client
client = chromadb.HttpClient(host='chromadb', port=8000)

# Create a collection
collection = client.get_or_create_collection(name='my_rag_collection')

# Add some dummy data
collection.add(
    documents=["Onyxia is a platform for data science.", "RAG stands for Retrieval Augmented Generation."],
    metadatas=[{"source": "onyxia"}, {"source": "ai"}],
    ids=["id1", "id2"]
)

# Query the collection
results = collection.query(
    query_texts=["What is Onyxia?"],
    n_results=1
)
print("Query Results:", results)
ONYXIA_FILE_6372a84e6f65

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install chromadb langchain openai tiktoken sentence-transformers

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_90324acaac04'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --allow-root --no-browser --NotebookApp.token='' --NotebookApp.password=''
ONYXIA_FILE_90324acaac04
chmod +x "${WORK_DIR}/onyxia/run.sh"

