#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Script de cartographie avec geopandas et folium
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carto_exemple.py")"
cat > "${WORK_DIR}/carto_exemple.py" <<'ONYXIA_FILE_814d777440fb'
import geopandas as gpd
import pandas as pd
import folium
from shapely.geometry import Point

# Exemple de données statistiques fictives
data = {
    'ville': ['Paris', 'Lyon', 'Marseille'],
    'population': [2161000, 513275, 861635],
    'longitude': [2.3522, 4.8357, 5.3698],
    'latitude': [48.8566, 45.7640, 43.2965]
}
df = pd.DataFrame(data)

# Création d'un GeoDataFrame
gdf = gpd.GeoDataFrame(df, geometry=gpd.points_from_xy(df.longitude, df.latitude))

# Création de la carte
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajout des marqueurs avec les données
for idx, row in gdf.iterrows():
    folium.Marker(
        location=[row['latitude'], row['longitude']],
        popup=f"{row['ville']}: {row['population']} habitants",
        icon=folium.Icon(color='blue')
    ).add_to(m)

# Sauvegarde
m.save('carte.html')
print("Carte sauvegardée dans carte.html")
ONYXIA_FILE_814d777440fb

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas pandas shapely matplotlib

