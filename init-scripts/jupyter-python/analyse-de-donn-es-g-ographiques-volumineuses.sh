#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Analyse de données géographiques volumineuses
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/main_analysis.py")"
cat > "${WORK_DIR}/main_analysis.py" <<'ONYXIA_FILE_05728e4ebb05'
import geopandas as gpd
import folium

# Exemple de chargement de données géographiques
# gdf = gpd.read_file('data/my_geodata.shp')

# Création d'une carte interactive
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)
folium.Marker([48.8566, 2.3522], popup='Paris').add_to(m)
m.save('map.html')
print('Carte générée : map.html')
ONYXIA_FILE_05728e4ebb05

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas shapely pyogrio geoplot

