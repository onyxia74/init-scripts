#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Installer les dépendances pour la cartographie et créer un script de démonstration pour générer une carte interactive avec Folium.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carte_interactive.py")"
cat > "${WORK_DIR}/carte_interactive.py" <<'ONYXIA_FILE_17cd98fd1558'
import folium

# Créer une carte centrée sur la France
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajouter un marqueur
folium.Marker(
    location=[48.8566, 2.3522],
    popup='Paris',
    icon=folium.Icon(color='red')
).add_to(m)

# Sauvegarder la carte
m.save('ma_carte_interactive.html')
print('Carte sauvegardée sous ma_carte_interactive.html')
ONYXIA_FILE_17cd98fd1558

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas plotly

