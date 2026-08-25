#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>vscode-python<|"|>,purpose:<|"|>Exemple de connexion GitHub via clone de dépôt pour illustrer la méthode de connexion.<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
