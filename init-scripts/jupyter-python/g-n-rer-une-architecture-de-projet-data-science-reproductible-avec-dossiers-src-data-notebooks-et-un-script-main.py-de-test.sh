#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Générer une architecture de projet data science reproductible avec dossiers src, data, notebooks et un script main.py de test.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/notebooks"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_125694ed89a3'
# Projet Data Science Reproductible

Ce projet est structuré pour assurer la reproductibilité des analyses.

## Structure
- `data/`: Données brutes et transformées.
- `src/`: Code source des analyses et scripts.
- `notebooks/`: Notebooks d'exploration.
- `requirements.txt`: Dépendances Python.
ONYXIA_FILE_125694ed89a3
mkdir -p "$(dirname "${WORK_DIR}/data/.gitkeep")"
cat > "${WORK_DIR}/data/.gitkeep" <<'ONYXIA_FILE_2c3faf59cfb4'

ONYXIA_FILE_2c3faf59cfb4
mkdir -p "$(dirname "${WORK_DIR}/notebooks/.gitkeep")"
cat > "${WORK_DIR}/notebooks/.gitkeep" <<'ONYXIA_FILE_037de03e7fa6'

ONYXIA_FILE_037de03e7fa6
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_2255dcb9bb2b'
import pandas as pd
import numpy as np

def main():
    print("Architecture Data Science prête !")
    # Exemple de création de données
    df = pd.DataFrame(np.random.randn(10, 2), columns=['A', 'B'])
    print("Données générées :\n", df)

if __name__ == '__main__':
    main()
ONYXIA_FILE_2255dcb9bb2b
mkdir -p "$(dirname "${WORK_DIR}/src/.gitkeep")"
cat > "${WORK_DIR}/src/.gitkeep" <<'ONYXIA_FILE_0f7c9e654ce1'

ONYXIA_FILE_0f7c9e654ce1

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas matplotlib seaborn scikit-learn scipy

