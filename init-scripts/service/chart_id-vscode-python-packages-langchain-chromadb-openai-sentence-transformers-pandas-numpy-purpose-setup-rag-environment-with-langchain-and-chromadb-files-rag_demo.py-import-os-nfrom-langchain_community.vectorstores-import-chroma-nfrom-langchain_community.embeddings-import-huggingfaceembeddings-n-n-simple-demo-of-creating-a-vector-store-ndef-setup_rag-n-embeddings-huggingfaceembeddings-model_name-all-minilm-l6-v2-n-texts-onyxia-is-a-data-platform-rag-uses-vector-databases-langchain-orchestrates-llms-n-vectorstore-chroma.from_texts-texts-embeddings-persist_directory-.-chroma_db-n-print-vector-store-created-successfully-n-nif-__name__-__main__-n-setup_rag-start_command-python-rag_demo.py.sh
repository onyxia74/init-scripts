#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["langchain","chromadb","openai","sentence-transformers","pandas","numpy"],"purpose":"setup rag environment with langchain and chromadb","files":{"rag_demo.py":"import os\nfrom langchain_community.vectorstores import Chroma\nfrom langchain_community.embeddings import HuggingFaceEmbeddings\n\n# Simple demo of creating a vector store\ndef setup_rag():\n    embeddings = HuggingFaceEmbeddings(model_name=\"all-MiniLM-L6-v2\")\n    texts = [\"Onyxia is a data platform\", \"RAG uses vector databases\", \"LangChain orchestrates LLMs\"]\n    vectorstore = Chroma.from_texts(texts, embeddings, persist_directory=\"./chroma_db\")\n    print(\"Vector store created successfully!\")\n\nif __name__ == '__main__':\n    setup_rag()"},"start_command":"python rag_demo.py"}'}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
