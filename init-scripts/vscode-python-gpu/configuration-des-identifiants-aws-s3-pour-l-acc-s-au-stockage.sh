#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python-gpu on Onyxia.
# Purpose: Configuration des identifiants AWS S3 pour l'accès au stockage
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/.aws"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/.aws/credentials")"
cat > "${WORK_DIR}/.aws/credentials" <<'ONYXIA_FILE_9471e78fbe5b'
[default]
aws_access_key_id = toto
aws_secret_access_key = titi
ONYXIA_FILE_9471e78fbe5b

