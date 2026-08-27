#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>jupyter-python<|"|>,packages:[<|"|>geopandas<|"|>,<|"|>folium<|"|>,<|"|>matplotlib<|"|>,<|"|>shapely<|"|>,<|"|>rasterio<|"|>,<|"|>contextily<|"|>],purpose:<|"|>préparation environnement cartographie et SIG avec bibliothèques géospatiales essentielles<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
