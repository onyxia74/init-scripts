#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Générer une architecture de projet data science reproductible avec dossiers src, data, notebooks et fichiers de configuration.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_0a0efb176e3c'
pandas
numpy
matplotlib
seaborn
scikit-learn
scipy
ONYXIA_FILE_0a0efb176e3c
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_4db3d9187f74'
# Projet Data Science Reproductible

## Structure du projet
- `data/`: Données brutes et transformées
- `notebooks/`: Notebooks d'exploration
- `src/`: Code source modulaire
- `requirements.txt`: Dépendances du projet
ONYXIA_FILE_4db3d9187f74
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_2fa9e2072c02'
import pandas as pd
import numpy as np

def main():
    print("Architecture de projet prête !")
    print(f"Pandas version: {pd.__version__}")

if __name__ == '__main__':
    main()
ONYXIA_FILE_2fa9e2072c02

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas matplotlib seaborn scikit-learn scipy
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

