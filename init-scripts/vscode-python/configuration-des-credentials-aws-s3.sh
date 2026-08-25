#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: configuration des credentials AWS S3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/aws_credentials.sh")"
cat > "${WORK_DIR}/aws_credentials.sh" <<'ONYXIA_FILE_7b60259b5cc0'
export AWS_ACCESS_KEY_ID=toto
export AWS_SECRET_ACCESS_KEY=titi
ONYXIA_FILE_7b60259b5cc0


export AWS_ACCESS_KEY_ID=toto
export AWS_SECRET_ACCESS_KEY=titi
