#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: lecture de fichiers S3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_example.R")"
cat > "${WORK_DIR}/s3_example.R" <<'ONYXIA_FILE_04bb9403a0a4'
library(aws.s3)

# Exemple de lecture d'un fichier S3
# Remplacez par vos propres informations
s3_bucket <- 'votre-bucket'
s3_key <- 'chemin/vers/votre/fichier.csv'

print(paste('Tentative de lecture de:', s3_key, 'dans le bucket:', s3_bucket))

# La lecture nécessite des credentials configurés (via variables d'env ou config)
# data <- s3readRDS(object = s3_key, bucket = s3_bucket)
# print(head(data))

print('Script prêt. Assurez-vous que vos variables d\'environnement AWS sont configurées.')
ONYXIA_FILE_04bb9403a0a4

# Install R packages.
Rscript -e 'install.packages(c('"'"'aws.s3'"'"', '"'"'aws.s3.utils'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

