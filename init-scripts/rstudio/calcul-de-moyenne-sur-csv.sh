#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: calcul de moyenne sur CSV
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/analyse_moyenne.R")"
cat > "${WORK_DIR}/analyse_moyenne.R" <<'ONYXIA_FILE_627aa738ab97'
# Script pour calculer la moyenne des colonnes numériques
if (file.exists('SRCV2025.csv')) {
  data <- read.csv('SRCV2025.csv')
  # Sélection des colonnes numériques
  numeric_cols <- sapply(data, is.numeric)
  # Calcul des moyennes
  means <- colMeans(data[, numeric_cols], na.rm = TRUE)
  print('Moyennes des colonnes numériques :')
  print(means)
} else {
  print('Erreur : Le fichier SRCV2025.csv est introuvable dans le répertoire de travail.')
}
ONYXIA_FILE_627aa738ab97

