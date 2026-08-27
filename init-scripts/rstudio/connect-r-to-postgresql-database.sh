#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Connect R to PostgreSQL database
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connection.R")"
cat > "${WORK_DIR}/connection.R" <<'ONYXIA_FILE_d1b5a3ddcda5'
library(RPostgres)
library(DBI)

# Replace with your actual credentials
con <- dbConnect(
  RPostgres::Postgres(),
  dbname = 'your_database',
  host = 'your_host',
  port = 5432,
  user = 'your_username',
  password = 'your_password'
)

# Test connection
print(dbGetQuery(con, 'SELECT version()'))

dbDisconnect(con)
ONYXIA_FILE_d1b5a3ddcda5

# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgres'"'"', '"'"'DBI'"'"', '"'"'dplyr'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

