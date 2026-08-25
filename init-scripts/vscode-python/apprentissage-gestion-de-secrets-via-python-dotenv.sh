#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: apprentissage gestion de secrets via python-dotenv
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/main.py")"
cat > "${WORK_DIR}/main.py" <<'ONYXIA_FILE_ebcd39621f67'
import os
from dotenv import load_dotenv

load_dotenv()

secret_key = os.getenv('MY_SECRET')
print(f'La valeur du secret est: {secret_key}')
ONYXIA_FILE_ebcd39621f67
mkdir -p "$(dirname "${WORK_DIR}/.env")"
cat > "${WORK_DIR}/.env" <<'ONYXIA_FILE_4b7508c71c5b'
MY_SECRET=mon_secret_super_securise
ONYXIA_FILE_4b7508c71c5b

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install python-dotenv

