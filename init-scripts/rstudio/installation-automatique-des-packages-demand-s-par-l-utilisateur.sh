#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: installation automatique des packages demandés par l'utilisateur
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'ggplot2'"'"', '"'"'data.table'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

