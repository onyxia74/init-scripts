#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Connect R to PostgreSQL database
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgres'"'"', '"'"'DBI'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

