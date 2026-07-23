#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Configuration environnement RAG avec base vectorielle et structure de projet
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_080ba7fcbd4c'
# Projet RAG
Ce projet est configuré pour le Retrieval-Augmented Generation.

## Structure
- `data/`: Stockage des documents et de la base vectorielle.
- `src/`: Code source pour l'ingestion et la requête.
- `src/main.py`: Point d'entrée principal.
ONYXIA_FILE_080ba7fcbd4c
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_7c73c3e6dcf0'
import pandas as pd
import numpy as np

def main():
    print('Environnement RAG prêt !')

if __name__ == '__main__':
    main()
ONYXIA_FILE_7c73c3e6dcf0

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install langchain chromadb sentence-transformers openai pandas numpy

