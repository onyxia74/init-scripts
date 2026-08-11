#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: architecture de projet data science reproductible
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/notebooks"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_f261f4f602b8'
# Projet Data Science

Ce projet suit une structure standard pour assurer la reproductibilité.

## Structure
- `data/`: Données brutes et transformées.
- `notebooks/`: Explorations et analyses.
- `src/`: Code source modulaire.
- `requirements.txt`: Dépendances du projet.
ONYXIA_FILE_f261f4f602b8
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_0b1da39f73b0'
pandas
numpy
matplotlib
seaborn
scikit-learn
scipy
ONYXIA_FILE_0b1da39f73b0
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_a66d116aae02'
import pandas as pd
import numpy as np

def main():
    print('Architecture de projet initialisée avec succès.')
    print(f'Pandas version: {pd.__version__}')

if __name__ == "__main__":
    main()
ONYXIA_FILE_a66d116aae02
mkdir -p "$(dirname "${WORK_DIR}/data/gitkeep")"
cat > "${WORK_DIR}/data/gitkeep" <<'ONYXIA_FILE_8e7db04fcec2'

ONYXIA_FILE_8e7db04fcec2
mkdir -p "$(dirname "${WORK_DIR}/src/gitkeep")"
cat > "${WORK_DIR}/src/gitkeep" <<'ONYXIA_FILE_4dd20cb0836c'

ONYXIA_FILE_4dd20cb0836c
mkdir -p "$(dirname "${WORK_DIR}/notebooks/gitkeep")"
cat > "${WORK_DIR}/notebooks/gitkeep" <<'ONYXIA_FILE_13fd598a2862'

ONYXIA_FILE_13fd598a2862

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas matplotlib seaborn scikit-learn scipy
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

