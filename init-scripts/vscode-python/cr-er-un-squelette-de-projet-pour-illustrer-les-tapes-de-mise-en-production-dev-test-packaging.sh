#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: créer un squelette de projet pour illustrer les étapes de mise en production (dev, test, packaging)
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_e188b60bb42b'
# Projet de Mise en Production

Ce projet suit un cycle de vie standard :
1. **Développement** : Écriture du code dans `src/`.
2. **Tests** : Validation via des scripts de test.
3. **Packaging** : Gestion des dépendances via `requirements.txt`.
4. **Déploiement** : Conteneurisation et orchestration.
ONYXIA_FILE_e188b60bb42b
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_b57b038c35de'
import pandas as pd
import numpy as np

def run_pipeline():
    print("Lancement du pipeline de données...")
    df = pd.DataFrame({'A': [1, 2, 3], 'B': [4, 5, 6]})
    print("Données chargées :")
    print(df)

if __name__ == '__main__':
    run_pipeline()
ONYXIA_FILE_b57b038c35de
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_06dba2c368fe'
pandas
numpy
ONYXIA_FILE_06dba2c368fe

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

