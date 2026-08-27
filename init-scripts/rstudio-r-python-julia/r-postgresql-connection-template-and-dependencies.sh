#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: R PostgreSQL connection template and dependencies
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect_db.R")"
cat > "${WORK_DIR}/connect_db.R" <<'ONYXIA_FILE_9edeaa2aef06'
library(DBI)
library(RPostgres)

# Template for connecting to PostgreSQL
# Replace placeholders with your actual credentials
con <- dbConnect(
  RPostgres::Postgres(),
  dbname = 'your_database',
  host = 'your_host',
  port = 5432,
  user = 'your_user',
  password = 'your_password'
)

# Test connection
print(dbGetQuery(con, 'SELECT 1'))

# Clean up
dbDisconnect(con)
ONYXIA_FILE_9edeaa2aef06

# Install R packages.
Rscript -e 'install.packages(c('"'"'DBI'"'"', '"'"'RPostgres'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

