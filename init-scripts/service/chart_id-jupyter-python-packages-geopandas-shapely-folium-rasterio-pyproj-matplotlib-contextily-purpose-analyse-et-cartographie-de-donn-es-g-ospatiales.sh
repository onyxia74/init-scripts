#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>jupyter-python<|"|>,packages:[<|"|>geopandas<|"|>,<|"|>shapely<|"|>,<|"|>folium<|"|>,<|"|>rasterio<|"|>,<|"|>pyproj<|"|>,<|"|>matplotlib<|"|>,<|"|>contextily<|"|>],purpose:<|"|>analyse et cartographie de données géospatiales<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
