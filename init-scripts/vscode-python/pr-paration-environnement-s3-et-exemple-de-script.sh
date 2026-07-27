#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: préparation environnement S3 et exemple de script
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_test.py")"
cat > "${WORK_DIR}/s3_test.py" <<'ONYXIA_FILE_a769e9f752a4'
import boto3
import os

# Les variables sont injectées par Onyxia si s3.enabled est true
session = boto3.Session(
    aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
    aws_session_token=os.getenv('AWS_SESSION_TOKEN'),
    region_name=os.getenv('AWS_DEFAULT_REGION')
)

s3 = session.client('s3', endpoint_url=os.getenv('AWS_ENDPOINT'))

print('Connexion S3 réussie avec l\'endpoint:', os.getenv('AWS_ENDPOINT'))
# Liste les buckets pour tester
try:
    response = s3.list_buckets()
    print('Buckets trouvés:', [b['Name'] for b in response['Buckets']])
except Exception as e:
    print('Erreur lors de la connexion:', e)
ONYXIA_FILE_a769e9f752a4

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3

