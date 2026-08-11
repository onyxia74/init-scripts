#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["langchain","openai","chromadb","tiktoken","sentence-transformers"],"purpose":"setup rag environment with langchain and chromadb","files":{"rag_demo.py":"import os\nfrom langchain_community.vectorstores import Chroma\nfrom langchain_community.embeddings import HuggingFaceEmbeddings\n\nprint(\'RAG environment ready!\')\nprint(\'You can now use ChromaDB to store and query embeddings.\')\n"},"start_command":"python rag_demo.py"}'}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
