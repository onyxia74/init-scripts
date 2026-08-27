#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: interactive map creation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/map.py")"
cat > "${WORK_DIR}/map.py" <<'ONYXIA_FILE_ba0d6716ba1b'
import folium

# Create a map centered on Paris
m = folium.Map(location=[48.8566, 2.3522], zoom_start=12)

# Add a marker
folium.Marker([48.8566, 2.3522], popup='Paris').add_to(m)

# Save the map
m.save('map.html')
print('Interactive map saved to map.html')
ONYXIA_FILE_ba0d6716ba1b

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas plotly

