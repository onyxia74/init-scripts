#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: illustrer les etapes de mise en production avec un squelette de projet structuré
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/tests"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_69f42a22725a'
# Projet de Mise en Production

Ce projet illustre le cycle de vie d'un projet Data Science :
1. **Exploration** (Notebooks/Scripts)
2. **Développement** (Code source dans `src/`)
3. **Tests** (Tests unitaires dans `tests/`)
4. **Packaging** (`requirements.txt`)
5. **Déploiement** (Conteneurisation/CI-CD)
ONYXIA_FILE_69f42a22725a
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_e20e62091b0b'
pandas
numpy
pytest
scikit-learn
matplotlib
ONYXIA_FILE_e20e62091b0b
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_29bbcadefec9'
def main():
    print('Simulation d\'un pipeline de production...')
    print('Étape 1: Chargement des données...')
    print('Étape 2: Prétraitement...')
    print('Étape 3: Entraînement du modèle...')
    print('Étape 4: Validation...')
    print('Étape 5: Exportation du modèle...')

if __name__ == "__main__":
    main()
ONYXIA_FILE_29bbcadefec9
mkdir -p "$(dirname "${WORK_DIR}/tests/test_main.py")"
cat > "${WORK_DIR}/tests/test_main.py" <<'ONYXIA_FILE_29d0afb90526'
def test_placeholder():
    assert True
ONYXIA_FILE_29d0afb90526

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas numpy pytest scikit-learn matplotlib
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

