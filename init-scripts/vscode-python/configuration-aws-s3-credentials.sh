#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: configuration AWS S3 credentials
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/aws_config.py")"
cat > "${WORK_DIR}/aws_config.py" <<'ONYXIA_FILE_0ec21e398ad7'
import os

# Configuration AWS S3
AWS_ACCESS_KEY_ID = 'toto'
AWS_SECRET_ACCESS_KEY = 'titi'

print('AWS credentials configured in environment variables (simulated via file).')
ONYXIA_FILE_0ec21e398ad7

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3


export AWS_ACCESS_KEY_ID=toto
export AWS_SECRET_ACCESS_KEY=titi
