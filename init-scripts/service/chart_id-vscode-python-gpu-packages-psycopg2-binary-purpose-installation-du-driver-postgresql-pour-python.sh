#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>vscode-python-gpu<|"|>,packages:[<|"|>psycopg2-binary<|"|>],purpose:<|"|>installation du driver postgresql pour python<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
