#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: S3 access demonstration
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_test.py")"
cat > "${WORK_DIR}/s3_test.py" <<'ONYXIA_FILE_850f12f26b40'
import boto3
import os

# In Onyxia, S3 credentials can be provided via environment variables
# or via a secret. This script demonstrates how to initialize a client.

s3 = boto3.client(
    's3',
    aws_access_key_id=os.getenv('S3_ACCESS_KEY_ID'),
    aws_secret_access_key=os.getenv('S3_SECRET_ACCESS_KEY'),
    endpoint_url=os.getenv('S3_ENDPOINT')
)

print('S3 client initialized successfully!')
# List buckets to verify access
try:
    response = s3.list_buckets()
    print('Buckets found:', [bucket['Name'] for bucket in response['Buckets']])
except Exception as e:
    print(f'Error accessing S3: {e}')
ONYXIA_FILE_850f12f26b40

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3

