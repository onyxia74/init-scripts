#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: configuration AWS S3 credentials
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/aws_config.py")"
cat > "${WORK_DIR}/aws_config.py" <<'ONYXIA_FILE_a5e33b840110'
import boto3
import os

# Les credentials sont injectés via les variables d'environnement
s3 = boto3.client(
    's3',
    aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY')
)

def list_buckets():
    response = s3.list_buckets()
    print('Buckets:')
    for bucket in response['Buckets']:
        print(f'  {bucket["Name"]}')

if __name__ == '__main__':
    list_buckets()
ONYXIA_FILE_a5e33b840110

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3


export AWS_ACCESS_KEY_ID=toto
export AWS_SECRET_ACCESS_KEY=titi
