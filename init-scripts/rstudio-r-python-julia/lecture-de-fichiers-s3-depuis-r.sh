#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: lecture de fichiers S3 depuis R
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install R packages.
Rscript -e 'install.packages(c('"'"'aws.s3'"'"', '"'"'aws.s3.utils'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

