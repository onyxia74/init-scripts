#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: architecture de projet data science reproductible
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_d15ea8b4cb15'
# Projet Data Science

Ce projet suit une structure standard pour assurer la reproductibilité.

## Installation
`pip install -r requirements.txt`
ONYXIA_FILE_d15ea8b4cb15
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_edeeaeba49d0'
pandas
numpy
scikit-learn
matplotlib
seaborn
ONYXIA_FILE_edeeaeba49d0
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_9e4e63443de2'
import pandas as pd
import numpy as np

def main():
    print('Projet initialisé avec succès.')

if __name__ == '__main__':
    main()
ONYXIA_FILE_9e4e63443de2

