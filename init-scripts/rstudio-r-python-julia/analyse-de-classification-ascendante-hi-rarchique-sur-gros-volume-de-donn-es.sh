#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: Analyse de classification ascendante hiérarchique sur gros volume de données
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'cluster'"'"', '"'"'factoextra'"'"', '"'"'tidyverse'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

