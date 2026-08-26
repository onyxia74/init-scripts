#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: configuration des credentials AWS S3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/.aws"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/.aws/credentials")"
cat > "${WORK_DIR}/.aws/credentials" <<'ONYXIA_FILE_8a872d5a69f6'
['[default]\naws_access_key_id = toto\naws_secret_access_key = titi\n']
ONYXIA_FILE_8a872d5a69f6


export AWS_ACCESS_KEY_ID=toto
export AWS_SECRET_ACCESS_KEY=titi
