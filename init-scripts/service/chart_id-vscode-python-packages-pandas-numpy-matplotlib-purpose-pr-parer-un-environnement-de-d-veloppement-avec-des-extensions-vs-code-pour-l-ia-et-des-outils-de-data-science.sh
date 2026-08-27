#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>vscode-python<|"|>,packages:[<|"|>pandas<|"|>,<|"|>numpy<|"|>,<|"|>matplotlib<|"|>],purpose:<|"|>Préparer un environnement de développement avec des extensions VS Code pour l'IA et des outils de data science.<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
