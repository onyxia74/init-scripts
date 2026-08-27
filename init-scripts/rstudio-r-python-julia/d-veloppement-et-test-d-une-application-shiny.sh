#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: développement et test d'une application Shiny
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'shinythemes'"'"', '"'"'bslib'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

