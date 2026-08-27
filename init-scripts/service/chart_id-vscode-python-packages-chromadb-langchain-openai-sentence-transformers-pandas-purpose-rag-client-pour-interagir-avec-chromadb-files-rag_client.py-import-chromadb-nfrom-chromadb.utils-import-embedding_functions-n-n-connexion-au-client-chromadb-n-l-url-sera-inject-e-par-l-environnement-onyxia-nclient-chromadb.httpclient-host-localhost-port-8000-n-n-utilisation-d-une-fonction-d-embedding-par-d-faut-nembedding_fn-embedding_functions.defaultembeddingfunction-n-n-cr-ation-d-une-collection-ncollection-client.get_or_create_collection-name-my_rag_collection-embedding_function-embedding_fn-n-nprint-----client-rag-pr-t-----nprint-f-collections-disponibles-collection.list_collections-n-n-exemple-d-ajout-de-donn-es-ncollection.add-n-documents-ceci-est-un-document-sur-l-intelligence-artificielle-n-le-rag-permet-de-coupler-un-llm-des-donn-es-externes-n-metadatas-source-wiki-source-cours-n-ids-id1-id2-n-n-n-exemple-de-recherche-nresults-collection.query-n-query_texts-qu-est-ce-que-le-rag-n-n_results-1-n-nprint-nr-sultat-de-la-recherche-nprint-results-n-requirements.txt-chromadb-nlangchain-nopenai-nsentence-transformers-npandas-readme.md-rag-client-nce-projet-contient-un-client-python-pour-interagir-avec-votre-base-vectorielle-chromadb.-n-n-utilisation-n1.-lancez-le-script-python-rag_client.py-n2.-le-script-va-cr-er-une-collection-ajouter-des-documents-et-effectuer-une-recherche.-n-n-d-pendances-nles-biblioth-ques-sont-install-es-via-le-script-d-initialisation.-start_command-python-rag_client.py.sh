#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["chromadb","langchain","openai","sentence-transformers","pandas"],"purpose":"RAG client pour interagir avec ChromaDB","files":{"rag_client.py":"import chromadb\nfrom chromadb.utils import embedding_functions\n\n# Connexion au client ChromaDB\n# L\'URL sera injectée par l\'environnement Onyxia\nclient = chromadb.HttpClient(host='localhost', port=8000)\n\n# Utilisation d\'une fonction d\'embedding par défaut\nembedding_fn = embedding_functions.DefaultEmbeddingFunction()\n\n# Création d\'une collection\ncollection = client.get_or_create_collection(name='my_rag_collection', embedding_function=embedding_fn)\n\nprint('--- Client RAG prêt ---')\nprint(f'Collections disponibles: {collection.list_collections()}')\n\n# Exemple d'ajout de données\ncollection.add(\n    documents=['Ceci est un document sur l\'intelligence artificielle',\n               'Le RAG permet de coupler un LLM à des données externes'],\n    metadatas=[{'source': 'wiki'}, {'source': 'cours'}],\n    ids=['id1', 'id2']\n)\n\n# Exemple de recherche\nresults = collection.query(\n    query_texts=['Qu\'est-ce que le RAG ?'],\n    n_results=1\n)\nprint('\\nRésultat de la recherche :')\nprint(results)\n"},"requirements.txt":"chromadb\\nlangchain\\nopenai\\nsentence-transformers\\npandas","README.md":"# RAG Client\\nCe projet contient un client Python pour interagir avec votre base vectorielle ChromaDB.\\n\\n## Utilisation\\n1. Lancez le script : `python rag_client.py`\\n2. Le script va créer une collection, ajouter des documents et effectuer une recherche.\\n\\n## Dépendances\\nLes bibliothèques sont installées via le script d'initialisation."},"start_command":"python rag_client.py"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
