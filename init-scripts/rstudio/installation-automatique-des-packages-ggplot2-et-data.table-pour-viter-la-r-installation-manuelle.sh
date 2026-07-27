#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: installation automatique des packages ggplot2 et data.table pour éviter la réinstallation manuelle
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'ggplot2'"'"', '"'"'data.table'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

