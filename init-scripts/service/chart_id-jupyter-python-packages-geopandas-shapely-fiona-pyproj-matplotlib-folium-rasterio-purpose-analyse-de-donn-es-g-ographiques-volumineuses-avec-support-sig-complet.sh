#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>jupyter-python<|"|>,packages:[<|"|>geopandas<|"|>,<|"|>shapely<|"|>,<|"|>fiona<|"|>,<|"|>pyproj<|"|>,<|"|>matplotlib<|"|>,<|"|>folium<|"|>,<|"|>rasterio<|"|>],purpose:<|"|>analyse de données géographiques volumineuses avec support SIG complet<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
