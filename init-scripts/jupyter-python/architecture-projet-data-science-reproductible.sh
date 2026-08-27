#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Architecture projet data science reproductible
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/notebooks"
mkdir -p "${WORK_DIR}/tests"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/__init__.py")"
cat > "${WORK_DIR}/src/__init__.py" <<'ONYXIA_FILE_c78e05835f91'

ONYXIA_FILE_c78e05835f91
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_5a714a320bd1'
import pandas as pd
import numpy as np

def load_data(path):
    """Charge les données depuis un fichier CSV."""
    return pd.read_csv(path)

def preprocess(df):
    """Nettoyage basique des données."""
    return df.dropna()

if __name__ == "__main__":
    print("Projet Data Science initialisé.")
ONYXIA_FILE_5a714a320bd1
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_cd2bbdd9c80a'
pandas
numpy
scikit-learn
matplotlib
ONYXIA_FILE_cd2bbdd9c80a
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_e3cf237187f8'
# Projet Data Science

Ce projet est structuré pour la reproductibilité.

## Structure
- `src/` : Code source
- `data/` : Données brutes et intermédiaires
- `notebooks/` : Analyses exploratoires
- `tests/` : Tests unitaires

## Installation
```bash
pip install -r requirements.txt
```

## Lancement
```bash
python src/main.py
```
ONYXIA_FILE_e3cf237187f8

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn matplotlib
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

