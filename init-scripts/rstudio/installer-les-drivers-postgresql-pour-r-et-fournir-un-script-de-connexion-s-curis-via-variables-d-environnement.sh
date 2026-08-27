#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Installer les drivers PostgreSQL pour R et fournir un script de connexion sécurisé via variables d'environnement.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect_db.R")"
cat > "${WORK_DIR}/connect_db.R" <<'ONYXIA_FILE_1d0dc49a376f'
# Connexion à PostgreSQL
# Utilisez les variables d'environnement pour la sécurité
# DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME

library(RPostgres)
library(DBI)

# Configuration (à adapter selon votre environnement)
db_host <- Sys.getenv("DB_HOST", unset = "localhost")
db_port <- as.integer(Sys.getenv("DB_PORT", unset = "5432"))
db_user <- Sys.getenv("DB_USER", unset = "postgres")
db_password <- Sys.getenv("DB_PASSWORD", unset = "")
db_name <- Sys.getenv("DB_NAME", unset = "mydb")

# Création de la connexion
con <- dbConnect(
  Postgres(),
  host = db_host,
  port = db_port,
  user = db_user,
  password = db_password,
  dbname = db_name
)

# Vérification de la connexion
if (dbIsValid(con)) {
  cat("Connexion réussie à PostgreSQL !\n")
  # Exemple de requête
  # df <- dbGetQuery(con, "SELECT * FROM ma_table LIMIT 5;")
  # print(df)
} else {
  cat("Échec de la connexion. Vérifiez vos variables d'environnement.\n")
}

# Penser à fermer la connexion à la fin : dbDisconnect(con)
ONYXIA_FILE_1d0dc49a376f

# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgres'"'"', '"'"'DBI'"'"', '"'"'dplyr'"'"', '"'"'tidyverse'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

