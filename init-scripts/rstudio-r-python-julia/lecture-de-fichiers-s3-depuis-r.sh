#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: lecture de fichiers S3 depuis R
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_example.R")"
cat > "${WORK_DIR}/s3_example.R" <<'ONYXIA_FILE_43bf8092a9d7'
# Exemple pour lire un fichier S3
library(aws.s3)

# Remplacez par vos informations
s3_bucket <- 'votre-bucket'
s3_key <- 'chemin/vers/votre/fichier.csv'

# Lecture du fichier
# Note: Les credentials S3 sont généralement gérés via les variables d'environnement
# ou les rôles IAM sur la plateforme.
data <- s3readRDS(object = s3_key, bucket = s3_bucket)
print(head(data))
ONYXIA_FILE_43bf8092a9d7

# Install R packages.
Rscript -e 'install.packages(c('"'"'aws.s3'"'"', '"'"'paws'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

