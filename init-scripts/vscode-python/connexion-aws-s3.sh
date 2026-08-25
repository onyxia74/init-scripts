#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: connexion AWS S3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_test.py")"
cat > "${WORK_DIR}/s3_test.py" <<'ONYXIA_FILE_229ac0bd9fe6'
import boto3
import os

# Les credentials sont injectés via les variables d'environnement S3 du chart
s3 = boto3.client('s3')

try:
    response = s3.list_buckets()
    print('Buckets trouvés :')
    for bucket in response['Buckets']:
        print(f'  - {bucket["Name"]}')
except Exception as e:
    print(f'Erreur de connexion : {e}')
ONYXIA_FILE_229ac0bd9fe6

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3

