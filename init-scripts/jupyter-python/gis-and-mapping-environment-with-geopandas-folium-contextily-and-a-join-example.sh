#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: GIS and mapping environment with geopandas, folium, contextily, and a join example
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/definition.py")"
cat > "${WORK_DIR}/definition.py" <<'ONYXIA_FILE_676b303d01ed'
import geopandas as gpd
import pandas as pd
import folium
import contextily as ctx
import matplotlib.pyplot as plt

# 1. Load your statistical data (e.g., CSV)
# stats = pd.read_csv('your_stats.csv')

# 2. Load your spatial data (e.g., GeoJSON, Shapefile)
# spatial_data = gpd.read_file('your_spatial_data.geojson')

# 3. Join the data
# merged_data = spatial_data.merge(stats, left_on='id', right_on='id')

# 4. Plot with a basemap
# m = folium.Map(location=[merged_data.geometry.centroid.y.mean(), merged_data.geometry.centroid.x.mean()], zoom_start=10)
# merged_data.explore(m=m)
# ctx.add_basemap(m)
# m.save('map.html')
ONYXIA_FILE_676b303d01ed

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install contextily folium geopandas matplotlib pandas numpy

