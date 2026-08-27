#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Installer les bibliothèques géospatiales et fournir un script d'exemple pour joindre des données à un fond de carte
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carte.py")"
cat > "${WORK_DIR}/carte.py" <<'ONYXIA_FILE_c2759ac539a5'
import pandas as pd
import geopandas as gpd
import folium
from shapely.geometry import Point

# 1. Données statistiques (ex: population par ville)
donnees_stats = pd.DataFrame({
    'ville': ['Paris', 'Lyon', 'Marseille'],
    'population': [2161000, 513272, 861635]
})

# 2. Données géographiques (ex: coordonnées des villes)
# Dans un cas réel, on chargerait un fichier GeoJSON ou Shapefile
# gpd.read_file('mon_fichier.geojson')
geometry = [Point(2.3522, 48.8566), Point(4.8357, 45.7640), Point(5.3698, 43.2965)]
gdf = gpd.GeoDataFrame(donnees_stats, geometry=geometry, crs='EPSG:4326')

# 3. Jointure (ici les données sont déjà jointes dans l'exemple simplifié)
# En pratique : gdf_joint = gdf.merge(donnees_stats, on='ville')

# 4. Visualisation avec Folium
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

for idx, row in gdf.iterrows():
    folium.CircleMarker(
        location=[row.geometry.y, row.geometry.x],
        radius=row['population'] / 100000, # Rayon proportionnel à la population
        popup=f"{row['ville']}: {row['population']} hab.",
        fill_color='blue',
        fill_opacity=0.5
    ).add_to(m)

m.save('carte.html')
print('Carte générée : carte.html')
ONYXIA_FILE_c2759ac539a5

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas pandas shapely matplotlib

