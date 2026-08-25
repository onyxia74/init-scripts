#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: fournir un notebook d'exemple et les bibliothèques de visualisation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exploration_data.ipynb")"
cat > "${WORK_DIR}/exploration_data.ipynb" <<'ONYXIA_FILE_dc8f1a6272d9'
# Notebook d'exploration de données
import pandas as pd
import matplotlib.pyplot as %s
import seaborn as sns
import numpy as np

# Exemple de chargement de données
# df = pd.read_csv('data.csv')
print('Environnement prêt pour l'exploration de données.')
ONYXIA_FILE_dc8f1a6272d9

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas matplotlib seaborn numpy

