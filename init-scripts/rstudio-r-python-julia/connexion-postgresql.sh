#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: connexion à PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connexion.R")"
cat > "${WORK_DIR}/connexion.R" <<'ONYXIA_FILE_449cbe2dc704'
# Exemple de connexion à PostgreSQL
library(RPostgreSQL)

# Remplacer par vos paramètres
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, user='votre_utilisateur', password='votre_mot_de_passe', host='votre_hote', port=5432, dbname='votre_base')

# Vérifier la connexion
if (dbIsValid(con)) {
  cat('Connexion réussie !\n')
} else {
  cat('Échec de la connexion.\n')
}

# Fermer la connexion
dbDisconnect(con)
ONYXIA_FILE_449cbe2dc704

# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgreSQL'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

