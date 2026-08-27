#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Configurer R pour se connecter à PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect_db.R")"
cat > "${WORK_DIR}/connect_db.R" <<'ONYXIA_FILE_d54ce970d449'
# Connexion à PostgreSQL
library(RPostgres)
library(DBI)

# Exemple de connexion
# Remplacer par vos propres credentials
host <- Sys.getenv("DB_HOST", "localhost")
port <- as.integer(Sys.getenv("DB_PORT", "5432"))
dbname <- Sys.getenv("DB_NAME", "mydb")
user <- Sys.getenv("DB_USER", "postgres")
password <- Sys.getenv("DB_PASSWORD", "")

# tryCatch pour gérer les erreurs de connexion
tryCatch({
  con <- dbConnect(
    Postgres,
    host = host,
    port = port,
    dbname = dbname,
    user = user,
    password = password
  )
  print("Connexion réussie !")
  dbDisconnect(con)
}, error = function(e) {
  print(paste("Erreur de connexion :", e$message))
})
ONYXIA_FILE_d54ce970d449

# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgres'"'"', '"'"'DBI'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

