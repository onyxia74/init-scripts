#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Exemple de visualisation de données avec matplotlib
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/visualisation_exemple.py")"
cat > "${WORK_DIR}/visualisation_exemple.py" <<'ONYXIA_FILE_3fd5ee3d202f'
import matplotlib.pyplot as plt
import numpy as np

# Génération de données d'exemple
np.random.seed(42)
x = np.random.rand(100)
y = np.random.rand(100)
z = x + y + np.random.normal(0, 0.1, 100)

# 1. Nuage de points (Scatter plot) : idéal pour voir les corrélations
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.scatter(x, y, c=z, cmap='viridis')
plt.title('Nuage de points : Corrélation')
plt.xlabel('Variable X')
plt.ylabel('Variable Y')

# 2. Histogramme : idéal pour voir la distribution
plt.subplot(1, 2, 2)
plt.hist(z, bins=20, color='steelblue', edgecolor='black')
plt.title('Histogramme : Distribution')
plt.xlabel('Valeur')
plt.ylabel('Fréquence')

plt.tight_layout()
plt.show()

print("Graphiques générés !")
ONYXIA_FILE_3fd5ee3d202f

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install matplotlib numpy plotly pandas seaborn

