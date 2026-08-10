#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: développement d'une API Python avec FastAPI
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_f1b5dde21f41'
fastapi
uvicorn
pandas
ONYXIA_FILE_f1b5dde21f41
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_43a73cf952bb'
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "API Python prête sur Onyxia!"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}
ONYXIA_FILE_43a73cf952bb
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_53f5820d9857'
# Projet API Python

Ce projet a été initialisé automatiquement pour le développement d'une API.

## Structure
- `src/`: Code source
- `data/`: Données
ONYXIA_FILE_53f5820d9857

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install fastapi uvicorn pandas

