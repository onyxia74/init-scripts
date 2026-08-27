#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Initialisation pour la cartographie avec geopandas et folium
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carto_demo.py")"
cat > "${WORK_DIR}/carto_demo.py" <<'ONYXIA_FILE_79e0517dd1ca'
import folium
import geopandas as gpd
from shapely.geometry import Point

# Création d'une carte centrée sur la France
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajout d'un marqueur
folium.Marker([48.8566, 2.3522], popup='Paris', icon=folium.Icon(color='red')).add_to(m)

# Sauvegarde
m.save('carte_france.html')
print('Carte générée : carte_france.html')
ONYXIA_FILE_79e0517dd1ca

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas shapely matplotlib contextily

