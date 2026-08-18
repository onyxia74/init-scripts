#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"superset","packages":["geopandas","folium","matplotlib","contextily","shapely"],"purpose":"préparation d'un environnement pour la cartographie interactive et l'analyse spatiale","files":{"requirements.txt":"geopandas
folium
matplotlib
contextily
shapely
"}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
