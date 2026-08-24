#!/usr/bin/env bash
set -euo pipefail

library(aws.s3)

# Note: Les identifiants S3 doivent être configurés via les variables d'environnement
# ou via le service S3 d'Onyxia si activé.

print('Tentative de lecture d'un fichier S3...')
# Exemple de commande (à adapter selon l'environnement réel)
# files <- get_bucket(bucket = 'mon-bucket-exemple', object = 'mon-fichier.csv')
# print(head(files))

print('Environnement prêt pour le travail sur S3.')
