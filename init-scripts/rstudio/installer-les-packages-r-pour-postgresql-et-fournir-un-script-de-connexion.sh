#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Installer les packages R pour PostgreSQL et fournir un script de connexion.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect_postgres.R")"
cat > "${WORK_DIR}/connect_postgres.R" <<'ONYXIA_FILE_7839517f1b66'
library(RPostgres)
library(DBI)

# Exemple de connexion
# Remplacez ces valeurs par les vôtres
host <- Sys.getenv('PG_HOST', 'localhost')
port <- as.integer(Sys.getenv('PG_PORT', '5432'))
dbname <- Sys.getenv('PG_DB', 'mydb')
user <- Sys.getenv('PG_USER', 'postgres')
password <- Sys.getenv('PG_PASSWORD', 'password')

conn <- dbConnect(
  Postgres(),
  host = host,
  port = port,
  dbname = dbname,
  user = user,
  password = password
)

# Vérifier la connexion
dbListTables(conn)

# Fermer la connexion
dbDisconnect(conn)
ONYXIA_FILE_7839517f1b66

# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgres'"'"', '"'"'DBI'"'"', '"'"'dplyr'"'"', '"'"'dbplyr'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

