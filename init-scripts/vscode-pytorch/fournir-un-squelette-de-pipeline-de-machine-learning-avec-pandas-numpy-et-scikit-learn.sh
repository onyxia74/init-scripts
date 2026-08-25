#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-pytorch on Onyxia.
# Purpose: fournir un squelette de pipeline de machine learning avec pandas, numpy et scikit-learn
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_5a3e3e661c45'
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

# Squelette de pipeline ML
def run_pipeline():
    print('Génération de données fictives...')
    X = np.random.rand(100, 5)
    y = np.random.randint(0, 2, 100)
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
    
    print('Entraînement du modèle...')
    model = RandomForestClassifier()
    model.fit(X_train, y_train)
    
    score = model.score(X_test, y_test)
    print(f'Score du modèle: {score}')

if __name__ == '__main__':
    run_pipeline()
ONYXIA_FILE_5a3e3e661c45
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_780d61761211'
# ML Pipeline Skeleton

Ce projet contient un squelette de base pour un pipeline de Machine Learning.

## Structure
- `app.py`: Script principal du pipeline.
- `requirements.txt`: Dépendances nécessaires.

## Utilisation
Lancez le script avec `python app.py`.
ONYXIA_FILE_780d61761211
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_539068d69d82'
pandas
numpy
scikit-learn
ONYXIA_FILE_539068d69d82

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

