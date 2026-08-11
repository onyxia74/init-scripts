#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>vscode-python<|"|>,packages:[<|"|>pandas<|"|>],purpose:<|"|>installation de l'extension Java et du package pandas<|"|>,vscode_extensions:[<|"|>vscjava.vscode-java-pack<|"|>]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
