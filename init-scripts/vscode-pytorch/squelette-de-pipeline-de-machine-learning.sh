#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-pytorch on Onyxia.
# Purpose: squelette de pipeline de machine learning
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/models"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_296a913361d1'
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split

def main():
    print('Pipeline ML initialisé')

if __name__ == '__main__':
    main()
ONYXIA_FILE_296a913361d1
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_83e52d4c50e0'
pandas
numpy
scikit-learn
torch
matplotlib
ONYXIA_FILE_83e52d4c50e0
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_456f4a6ae329'
# Projet Machine Learning

Structure générée pour un pipeline ML.

## Dossiers
- `data/`: données brutes et traitées
- `models/`: modèles entraînés
- `src/`: code source
ONYXIA_FILE_456f4a6ae329

