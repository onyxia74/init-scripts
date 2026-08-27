#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: exploration de dataset population française
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/notebooks"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_cb4827d6303c'
# Exploration Population Française
Ce projet est configuré pour l'analyse de données démographiques.

## Structure
- `data/` : Contient les fichiers de données.
- `notebooks/` : Notebooks d'exploration.
- `src/` : Scripts d'analyse.
ONYXIA_FILE_cb4827d6303c
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_720f03d29789'
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

def main():
    print('Environnement prêt pour l'analyse de la population française.')

if __name__ == '__main__':
    main()
ONYXIA_FILE_720f03d29789

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install matplotlib numpy pandas seaborn geopandas folium

