#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>rstudio-r-python-julia<|"|>,purpose:<|"|>lecture de fichiers S3 avec R (aws.s3, paws, ou arrow)<|"|>,r_packages:[<|"|>aws.s3<|"|>,<|"|>paws<|"|>,<|"|>arrow<|"|>]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
