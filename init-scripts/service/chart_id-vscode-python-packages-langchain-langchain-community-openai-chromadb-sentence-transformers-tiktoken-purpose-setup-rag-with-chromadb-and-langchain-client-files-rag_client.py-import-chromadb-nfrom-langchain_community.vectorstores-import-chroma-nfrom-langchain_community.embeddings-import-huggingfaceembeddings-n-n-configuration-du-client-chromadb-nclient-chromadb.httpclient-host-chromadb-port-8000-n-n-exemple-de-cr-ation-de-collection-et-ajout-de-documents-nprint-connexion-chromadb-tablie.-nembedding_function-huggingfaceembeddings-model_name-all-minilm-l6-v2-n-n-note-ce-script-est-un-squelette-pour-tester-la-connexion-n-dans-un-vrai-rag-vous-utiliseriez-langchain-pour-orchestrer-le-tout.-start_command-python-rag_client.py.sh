#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["langchain","langchain-community","openai","chromadb","sentence-transformers","tiktoken"],"purpose":"setup rag with chromadb and langchain client","files":{"rag_client.py":"import chromadb\nfrom langchain_community.vectorstores import Chroma\nfrom langchain_community.embeddings import HuggingFaceEmbeddings\n\n# Configuration du client ChromaDB\nclient = chromadb.HttpClient(host='chromadb', port=8000)\n\n# Exemple de création de collection et ajout de documents\nprint(\"Connexion à ChromaDB établie.\")\nembedding_function = HuggingFaceEmbeddings(model_name=\"all-MiniLM-L6-v2\")\n\n# Note: Ce script est un squelette pour tester la connexion\n# Dans un vrai RAG, vous utiliseriez langchain pour orchestrer le tout."},"start_command":"python rag_client.py"}'}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
