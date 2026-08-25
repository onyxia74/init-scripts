#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-r-python-julia on Onyxia.
# Purpose: connexion a postgresql
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connection_test.R")"
cat > "${WORK_DIR}/connection_test.R" <<'ONYXIA_FILE_0ac0025b40fb'
library(DBI)
library(RPostgreSQL)
# Template pour la connexion
# con <- dbConnect(PostgreSQL(), dbname='...', host='...', port=5432, user='...', password='...')
print("Prêt pour la connexion PostgreSQL")
ONYXIA_FILE_0ac0025b40fb

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install tidyverse DBI RPostgreSQL

# Install R packages.
Rscript -e 'install.packages(c('"'"'DBI'"'"', '"'"'RPostgreSQL'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'


echo "Connection string: postgresql://user:password@host:port/db" > connection_info.txt
