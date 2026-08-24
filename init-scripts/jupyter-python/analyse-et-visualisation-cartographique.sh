#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: analyse et visualisation cartographique
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/map_demo.ipynb")"
cat > "${WORK_DIR}/map_demo.ipynb" <<'ONYXIA_FILE_5cead98aac65'
# Exemple de cartographie interactive
import geopandas as gpd
import folium

# Création d'une carte de base
m = folium.Map(location=[48.8566, 2.3522], zoom_start=12)
m.save('map.html')
print('Carte de base générée dans map.html')
ONYXIA_FILE_5cead98aac65

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install geopandas folium matplotlib contextily shapely

