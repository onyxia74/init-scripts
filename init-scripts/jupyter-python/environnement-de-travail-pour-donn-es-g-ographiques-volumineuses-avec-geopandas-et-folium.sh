#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Environnement de travail pour données géographiques volumineuses avec geopandas et folium
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/geodata_analysis.py")"
cat > "${WORK_DIR}/geodata_analysis.py" <<'ONYXIA_FILE_f47f513e4b2a'
import geopandas as gpd
import folium

# Exemple de chargement de données géographiques
# gdf = gpd.read_file('path/to/data.geojson')

# Création d'une carte basique
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)
folium.Marker([46.603354, 1.888334], popup='France').add_to(m)
m.save('map.html')
print('Carte générée : map.html')
ONYXIA_FILE_f47f513e4b2a

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas shapely pyogrio contextily

