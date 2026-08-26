#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: installer un agent de code ou outil d'IA pour R
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'reticulate'"'"', '"'"'tidyverse'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'


R -e 'install.packages(c("reticulate", "tidyverse"))'
echo 'Packages d'IA installés avec succès'
R
