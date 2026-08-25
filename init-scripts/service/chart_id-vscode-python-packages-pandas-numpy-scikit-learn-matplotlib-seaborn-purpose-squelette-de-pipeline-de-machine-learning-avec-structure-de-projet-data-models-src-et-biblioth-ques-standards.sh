#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>vscode-python<|"|>,packages:[<|"|>pandas<|"|>,<|"|>numpy<|"|>,<|"|>scikit-learn<|"|>,<|"|>matplotlib<|"|>,<|"|>seaborn<|"|>],purpose:<|"|>squelette de pipeline de machine learning avec structure de projet (data, models, src) et bibliothèques standards<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
