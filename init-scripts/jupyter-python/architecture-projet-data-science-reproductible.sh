#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Architecture projet data science reproductible
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/tests"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_9401d477204f'
import pandas as pd
import numpy as np

def load_data():
    # Placeholder pour le chargement des données
    return pd.DataFrame({'col1': [1, 2, 3]})

def process_data(df):
    # Placeholder pour le traitement
    return df.describe()

if __name__ == '__main__':
    df = load_data()
    print(process_data(df))
ONYXIA_FILE_9401d477204f
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_7fb0967a5e1c'
pandas
numpy
ONYXIA_FILE_7fb0967a5e1c
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_96294ca2b552'
# Projet Data Science

## Structure
- `src/` : Code source
- `data/` : Données brutes et intermédiaires
- `tests/` : Tests unitaires

## Installation
```bash
pip install -r requirements.txt
```

## Lancement
```bash
python src/main.py
```
ONYXIA_FILE_96294ca2b552

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

