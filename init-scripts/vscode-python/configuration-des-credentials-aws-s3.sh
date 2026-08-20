#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: configuration des credentials AWS S3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/aws_config.py")"
cat > "${WORK_DIR}/aws_config.py" <<'ONYXIA_FILE_28826af155b4'
import boto3

# Configuration AWS S3
s3 = boto3.client(
    's3',
    aws_access_key_id='toto',
    aws_secret_access_key='titi'
)

print('Client S3 initialisé avec succès.')
ONYXIA_FILE_28826af155b4

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3


pip install boto3
