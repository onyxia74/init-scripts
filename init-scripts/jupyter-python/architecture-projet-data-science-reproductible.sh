#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: architecture projet data science reproductible
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/notebooks"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_9ee10fee968b'
import pandas as pd
import numpy as np

# Exemple de chargement de données
def load_data(path):
    return pd.read_csv(path)

if __name__ == "__main__":
    print("Démarrage du pipeline data science...")
    # df = load_data('data/raw.csv')
    # ... traitement ...
ONYXIA_FILE_9ee10fee968b
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_8d7c52a19bfe'
# Projet Data Science

Structure du projet :
- `src/` : Code source
- `data/` : Données brutes et propres
- `notebooks/` : Analyses exploratoires

Dépendances : pandas, numpy, scikit-learn
ONYXIA_FILE_8d7c52a19bfe

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn

