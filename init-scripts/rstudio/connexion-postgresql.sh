#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: connexion postgresql
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'DBI'"'"', '"'"'RPostgreSQL'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

