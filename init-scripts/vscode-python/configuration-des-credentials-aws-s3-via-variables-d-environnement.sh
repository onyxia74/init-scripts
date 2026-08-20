#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: configuration des credentials AWS S3 via variables d'environnement
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/aws_config.py")"
cat > "${WORK_DIR}/aws_config.py" <<'ONYXIA_FILE_1d7f3b416fbb'
import boto3
import os

s3 = boto3.client(
    's3',
    aws_access_key_id='toto',
    aws_secret_access_key='titi'
)

print('Client S3 initialisé avec succès.')
ONYXIA_FILE_1d7f3b416fbb

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3


pip install boto3
