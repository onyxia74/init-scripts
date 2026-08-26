#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Installer les packages R pour la connexion à PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgres'"'"', '"'"'DBI'"'"', '"'"'dplyr'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

