#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: squelette projet data science reproductible
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/tests"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_2a916e069add'
pandas
numpy
scikit-learn
matplotlib
seaborn
ONYXIA_FILE_2a916e069add
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_9aae2ea41b20'
import pandas as pd
import numpy as np

print("Initialisation du projet Data Science...")
print("Environnement prêt.")

# Exemple de chargement de données
# df = pd.read_csv('data/input.csv')

if __name__ == "__main__":
    print("Script principal exécuté avec succès.")
ONYXIA_FILE_9aae2ea41b20
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_b8fe4f1797dc'
# Projet Data Science

## Structure
- `src/` : Code source
- `data/` : Données brutes et intermédiaires
- `tests/` : Tests unitaires

## Installation
Les dépendances sont listées dans `requirements.txt`.

## Lancement
Exécutez `python src/main.py` ou ouvrez un notebook dans Jupyter.
ONYXIA_FILE_b8fe4f1797dc

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn matplotlib seaborn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_207d13ccc92c'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python src/main.py
ONYXIA_FILE_207d13ccc92c
chmod +x "${WORK_DIR}/onyxia/run.sh"

