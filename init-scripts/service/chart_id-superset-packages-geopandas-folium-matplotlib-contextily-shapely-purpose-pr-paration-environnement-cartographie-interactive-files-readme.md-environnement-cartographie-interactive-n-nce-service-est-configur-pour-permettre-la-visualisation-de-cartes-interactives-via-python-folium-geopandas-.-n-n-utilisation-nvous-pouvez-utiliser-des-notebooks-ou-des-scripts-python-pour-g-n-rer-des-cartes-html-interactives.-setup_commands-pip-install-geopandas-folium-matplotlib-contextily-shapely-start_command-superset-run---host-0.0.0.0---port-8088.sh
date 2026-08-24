#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"superset","packages":["geopandas","folium","matplotlib","contextily","shapely"],"purpose":"préparation environnement cartographie interactive","files":{"README.md":"# Environnement Cartographie Interactive\n\nCe service est configuré pour permettre la visualisation de cartes interactives via Python (Folium, Geopandas).\n\n## Utilisation\nVous pouvez utiliser des notebooks ou des scripts Python pour générer des cartes HTML interactives."},"setup_commands":["pip install geopandas folium matplotlib contextily shapely"],"start_command":"superset run --host=0.0.0.0 --port=8088"}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
