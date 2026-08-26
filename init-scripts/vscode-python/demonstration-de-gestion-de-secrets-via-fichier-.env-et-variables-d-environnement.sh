#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: demonstration de gestion de secrets via fichier .env et variables d'environnement
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_4ff0b091fe4b'
import os
from dotenv import load_dotenv

load_dotenv()

secret_key = os.getenv('MY_SECRET_KEY', 'default_value')
print(f'La valeur du secret est : {secret_key}')
ONYXIA_FILE_4ff0b091fe4b
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_6773f88cab73'
python-dotenv
ONYXIA_FILE_6773f88cab73
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_b4171ac6f1bc'
# Test de Secrets
Exécutez `python app.py` pour tester la lecture du fichier .env.
ONYXIA_FILE_b4171ac6f1bc

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install python-dotenv
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

