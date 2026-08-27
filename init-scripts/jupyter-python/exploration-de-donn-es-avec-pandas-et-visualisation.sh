#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: exploration de données avec pandas et visualisation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/explore_data.py")"
cat > "${WORK_DIR}/explore_data.py" <<'ONYXIA_FILE_00d2a2b55b7b'
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Exemple d'exploration de données
# Charger un fichier CSV (remplacer par votre fichier)
# df = pd.read_csv('data.csv')

# Générer des données fictives pour la démo
np.random.seed(42)
data = np.random.randn(1000)
df = pd.DataFrame(data, columns=['values'])

# Statistiques descriptives
print(df.describe())

# Visualisation
plt.figure(figsize=(10, 6))
plt.hist(df['values'], bins=30, color='skyblue', edgecolor='black')
plt.title('Distribution des données')
plt.xlabel('Valeur')
plt.ylabel('Fréquence')
plt.grid(True)
plt.show()
ONYXIA_FILE_00d2a2b55b7b

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install matplotlib numpy pandas

