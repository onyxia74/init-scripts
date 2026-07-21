#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: fournir un exemple de code pour répondre à la demande de l'utilisateur
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exemple_graphique.py")"
cat > "${WORK_DIR}/exemple_graphique.py" <<'ONYXIA_FILE_2c55483403f2'
import matplotlib.pyplot as plt
import numpy as np

# Génération de données
x = np.linspace(0, 10, 100)
y = np.sin(x)

# Création du graphique
plt.figure(figsize=(8, 5))
plt.plot(x, y, label='Sinus(x)')

# Ajout du titre et de la légende (demande de l'utilisateur)
plt.title('Mon Graphique avec Titre')
plt.xlabel('Axe X')
plt.ylabel('Axe Y')
plt.legend()

# Affichage
plt.grid(True)
plt.show()
ONYXIA_FILE_2c55483403f2

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install matplotlib pandas numpy

