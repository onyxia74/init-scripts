#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Création de carte interactive avec Folium
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carte.py")"
cat > "${WORK_DIR}/carte.py" <<'ONYXIA_FILE_393cfaf9881e'
import folium

# Créer une carte centrée sur Paris
m = folium.Map(location=[48.8566, 2.3522], zoom_start=12)

# Ajouter un marqueur
folium.Marker([48.8566, 2.3522], popup='Paris', tooltip='Capitale de la France').add_to(m)

# Sauvegarder la carte
m.save('carte.html')
print('Carte sauvegardée dans carte.html')
ONYXIA_FILE_393cfaf9881e

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas plotly

