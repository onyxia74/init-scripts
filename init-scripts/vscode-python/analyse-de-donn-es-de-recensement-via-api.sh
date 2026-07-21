#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: analyse de données de recensement via API
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/main.py")"
cat > "${WORK_DIR}/main.py" <<'ONYXIA_FILE_2f1309e3c92f'
import pandas as pd
import requests

def fetch_census_data(api_url):
    # Exemple de structure pour interroger une API
    response = requests.get(api_url)
    if response.status_code == 200:
        data = response.json()
        return pd.DataFrame(data)
    else:
        print(f'Erreur: {response.status_code}')
        return None

if __name__ == '__main__':
    print('Environnement prêt pour l'analyse de données.')
ONYXIA_FILE_2f1309e3c92f

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas requests numpy matplotlib

