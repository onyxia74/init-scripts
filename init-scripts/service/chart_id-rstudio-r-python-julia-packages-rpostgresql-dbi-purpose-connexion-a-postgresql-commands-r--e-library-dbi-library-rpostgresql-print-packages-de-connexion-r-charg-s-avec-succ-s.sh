#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"rstudio-r-python-julia","packages":["RPostgreSQL","DBI"],"purpose":"connexion a postgresql","commands":["R -e "library(DBI); library(RPostgreSQL); print(\"Packages de connexion R chargés avec succès!\")""]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
