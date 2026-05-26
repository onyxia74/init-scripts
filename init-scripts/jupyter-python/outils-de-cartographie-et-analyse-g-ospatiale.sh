#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: outils de cartographie et analyse géospatiale
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install geopandas folium matplotlib shapely contextily rasterio

