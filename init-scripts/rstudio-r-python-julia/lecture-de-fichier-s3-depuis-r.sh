#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: lecture de fichier S3 depuis R
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/example.R")"
cat > "${WORK_DIR}/example.R" <<'ONYXIA_FILE_6f9178590b75'
# Exemple de lecture d'un fichier S3 depuis R
library(aws.s3)
# Remplacer par vos identifiants S3
s3 <- s3(key='votre_access_key', secret='votre_secret_key', region='eu-west-1')
# Lire un fichier
fichier <- s3_get(s3, bucket='votre-bucket', key='chemin/vers/fichier.csv')
# Convertir en data frame
donnees <- read.csv(text=fichier)
print(head(donnees))
ONYXIA_FILE_6f9178590b75

# Install R packages.
Rscript -e 'install.packages(c('"'"'aws.s3'"'"', '"'"'rio'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

