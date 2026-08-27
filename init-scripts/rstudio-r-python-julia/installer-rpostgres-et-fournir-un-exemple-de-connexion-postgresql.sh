#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: Installer RPostgres et fournir un exemple de connexion PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect.R")"
cat > "${WORK_DIR}/connect.R" <<'ONYXIA_FILE_69ab6a44bbc3'
library(RPostgres)
# Exemple de connexion
# db <- dbConnect(
#   RPostgres::Postgres(),
#   dbname = 'your_db',
#   host = 'your_host',
#   port = 5432,
#   user = 'your_user',
#   password = 'your_password'
# )
# print(dbGetQuery(db, 'SELECT 1'))
# dbDisconnect(db)
ONYXIA_FILE_69ab6a44bbc3

# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgres'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

