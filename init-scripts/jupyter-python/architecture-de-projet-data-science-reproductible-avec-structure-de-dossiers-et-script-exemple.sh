#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: architecture de projet data science reproductible avec structure de dossiers et script exemple
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/notebooks"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_55bcfa122f9d'
# Projet Data Science Reproductible

Ce projet suit une structure standard pour assurer la reproductibilité des analyses.

## Structure
- `data/`: Données brutes et transformées.
- `src/`: Code source des analyses.
- `notebooks/`: Notebooks d'exploration.
- `requirements.txt`: Dépendances du projet.
ONYXIA_FILE_55bcfa122f9d
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_1cba3f25727e'
pandas
numpy
matplotlib
seaborn
scikit-learn
geopandas
folium
ONYXIA_FILE_1cba3f25727e
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_1fd83dc8507a'
import pandas as pd
import numpy as np

def main():
    print("🚀 Initialisation du projet Data Science...")
    data = pd.DataFrame({'A': [1, 2, 3], 'B': [4, 5, 6]})
    print("✅ Données générées avec succès :\n", data)

if __name__ == '__main__':
    main()
ONYXIA_FILE_1fd83dc8507a
mkdir -p "$(dirname "${WORK_DIR}/data/.gitkeep")"
cat > "${WORK_DIR}/data/.gitkeep" <<'ONYXIA_FILE_2c3faf59cfb4'

ONYXIA_FILE_2c3faf59cfb4
mkdir -p "$(dirname "${WORK_DIR}/src/.gitkeep")"
cat > "${WORK_DIR}/src/.gitkeep" <<'ONYXIA_FILE_0f7c9e654ce1'

ONYXIA_FILE_0f7c9e654ce1
mkdir -p "$(dirname "${WORK_DIR}/notebooks/.gitkeep")"
cat > "${WORK_DIR}/notebooks/.gitkeep" <<'ONYXIA_FILE_037de03e7fa6'

ONYXIA_FILE_037de03e7fa6

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas matplotlib seaborn scikit-learn geopandas folium
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

