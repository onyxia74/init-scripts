#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: exemple de visualisation avec axes en français
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exemple_graphique.py")"
cat > "${WORK_DIR}/exemple_graphique.py" <<'ONYXIA_FILE_c65696d15d48'
import matplotlib.pyplot as plt
import numpy as np

# Données d'exemple
x = np.linspace(0, 10, 100)
y = np.sin(x)

# Création du graphique
plt.figure(figsize=(8, 4))
plt.plot(x, y)

# Ajout des libellés en français
plt.title('Exemple de graphique avec axes en français')
plt.xlabel('Temps (secondes)')
plt.ylabel('Amplitude')

plt.grid(True)
plt.show()
print('Graphique généré avec succès !')
ONYXIA_FILE_c65696d15d48

