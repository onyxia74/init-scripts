#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: exploration de dataset population française avec outils de data science
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_02c0c7fc9dda'
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Exemple de structure pour l'exploration de données
def explore_data():
    print('Prêt pour l'exploration de la population française.')
    # Ici, vous pourrez charger votre dataset
    # df = pd.read_csv('votre_fichier.csv')
    # print(df.head())

if __name__ == '__main__':
    explore_data()
ONYXIA_FILE_02c0c7fc9dda
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_3c7596fe7e8d'
# Exploration Population Française

Ce projet est configuré pour l'analyse de données de la population française.

## Environnement
- Python 3
- Pandas, Numpy, Matplotlib

## Utilisation
Lancez le script `app.py` pour commencer.
ONYXIA_FILE_3c7596fe7e8d

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install matplotlib numpy pandas geopandas folium

