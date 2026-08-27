#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-r-python-julia on Onyxia.
# Purpose: Environnement R pour data science
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/setup.R")"
cat > "${WORK_DIR}/setup.R" <<'ONYXIA_FILE_a052ac198c60'
# Setup R environment
library(tidyverse)
cat("R environment ready with tidyverse\n")
ONYXIA_FILE_a052ac198c60

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install tidyverse dplyr ggplot2

# Install R packages.
Rscript -e 'install.packages(c('"'"'tidyverse'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

