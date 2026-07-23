#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pyspark on Onyxia.
# Purpose: préparation d'un environnement de travail structuré pour données volumineuses
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/notebooks"

