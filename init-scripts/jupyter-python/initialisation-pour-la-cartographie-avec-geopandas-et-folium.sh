#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Initialisation pour la cartographie avec geopandas et folium
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carte.py")"
cat > "${WORK_DIR}/carte.py" <<'ONYXIA_FILE_8e4164a72a26'
import folium
from folium.plugins import HeatMap

# Créer une carte centrée sur la France
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajouter quelques marqueurs d'exemple
folium.Marker([48.8566, 2.3522], popup='Paris', tooltip='Capitale').add_to(m)
folium.Marker([43.2965, 5.3698], popup='Marseille', tooltip='Port de Méditerranée').add_to(m)

# Sauvegarder la carte
m.save('ma_carte.html')
print('Carte sauvegardée dans ma_carte.html')
ONYXIA_FILE_8e4164a72a26

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib

