#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: configuration des credentials AWS S3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/aws_config.sh")"
cat > "${WORK_DIR}/aws_config.sh" <<'ONYXIA_FILE_4faaf7f9fdfe'
export AWS_ACCESS_KEY_ID=toto
export AWS_SECRET_ACCESS_KEY=titi
echo 'AWS credentials configured'"
ONYXIA_FILE_4faaf7f9fdfe


export AWS_ACCESS_KEY_ID=toto
export AWS_SECRET_ACCESS_KEY=titi
