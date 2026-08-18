#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"rstudio-r-python-julia","packages":["aws.s3","aws.s3.utils"],"purpose":"lecture de fichiers S3","files":{"s3_example.R":"library(aws.s3)\n\n# Exemple de lecture d'un fichier S3\n# Remplacez par vos informations\ns3_bucket <- 'votre-bucket'\ns3_key <- 'chemin/vers/votre/fichier.csv'\n\n# Pour utiliser les credentials de l'environnement (S3_ACCESS_KEY_ID, etc.)\n# data <- s3readRDS(object = s3_key, bucket = s3_bucket)\n# Ou pour un CSV :\n# data <- s3read_using(FUN = read.csv, object = s3_key, bucket = s3_bucket)\n\nprint('Environnement prêt pour S3. Utilisez les variables d'environnement pour l\'authentification.')"}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
