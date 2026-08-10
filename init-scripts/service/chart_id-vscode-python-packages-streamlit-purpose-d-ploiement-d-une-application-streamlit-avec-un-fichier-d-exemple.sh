#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>vscode-python<|"|>,packages:[<|"|>streamlit<|"|>],purpose:<|"|>déploiement d'une application Streamlit avec un fichier d'exemple<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
