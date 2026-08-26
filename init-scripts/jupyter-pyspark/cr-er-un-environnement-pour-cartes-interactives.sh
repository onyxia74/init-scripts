#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pyspark on Onyxia.
# Purpose: Créer un environnement pour cartes interactives
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/demo_cartes.py")"
cat > "${WORK_DIR}/demo_cartes.py" <<'ONYXIA_FILE_ecaacca6d8e9'
import folium

# Créer une carte centrée sur la France
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajouter un marqueur
folium.Marker([48.8566, 2.3522], popup='Paris', tooltip='Capitale de la France').add_to(m)

# Sauvegarder
m.save('carte_interactive.html')
print('Carte sauvegardée dans carte_interactive.html')
ONYXIA_FILE_ecaacca6d8e9
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_9b75cea22655'
# Démo Cartes Interactives

Ce projet contient un script de démonstration pour créer des cartes interactives avec Folium.

## Utilisation

1. Ouvrez `demo_cartes.py` dans JupyterLab.
2. Exécutez les cellules.
3. Ouvrez le fichier `carte_interactive.html` généré.
ONYXIA_FILE_9b75cea22655

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas pandas

