#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Architecture de projet data science reproductible
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_0eef98aa2ac0'
pandas
numpy
scikit-learn
ONYXIA_FILE_0eef98aa2ac0
mkdir -p "$(dirname "${WORK_DIR}/src/__init__.py")"
cat > "${WORK_DIR}/src/__init__.py" <<'ONYXIA_FILE_c78e05835f91'

ONYXIA_FILE_c78e05835f91
mkdir -p "$(dirname "${WORK_DIR}/src/data_loader.py")"
cat > "${WORK_DIR}/src/data_loader.py" <<'ONYXIA_FILE_5687bc46f64d'
import pandas as pd

def load_data(path):
    """Charge les données depuis un fichier CSV."""
    return pd.read_csv(path)
ONYXIA_FILE_5687bc46f64d
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_787499a831ec'
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Chargement des données
# data = load_data('data/dataset.csv')

# Exemple de pipeline reproductible
print("Initialisation du pipeline de data science...")
print("Architecture : src/ pour le code, data/ pour les données.")
print("Prêt pour l'analyse et le machine learning.")
ONYXIA_FILE_787499a831ec
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_16f0afd5703d'
# Projet Data Science

## Structure
- `src/` : Code source (chargement, entraînement, prédiction)
- `data/` : Données brutes et intermédiaires
- `requirements.txt` : Dépendances Python

## Utilisation
1. Placez vos données dans `data/`
2. Modifiez `src/main.py` pour charger vos fichiers
3. Exécutez `python src/main.py`
ONYXIA_FILE_16f0afd5703d

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas scikit-learn numpy
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

