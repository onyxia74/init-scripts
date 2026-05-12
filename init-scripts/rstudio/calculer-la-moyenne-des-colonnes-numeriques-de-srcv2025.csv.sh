#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: calculer la moyenne des colonnes numeriques de SRCV2025.csv
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/calcul_moyenne.R")"
cat > "${WORK_DIR}/calcul_moyenne.R" <<'ONYXIA_FILE_7b1e99ffa287'
# Script pour calculer la moyenne des colonnes numériques
if (file.exists('SRCV2025.csv')) {
  data <- read.csv('SRCV2025.csv')
  # Sélection des colonnes numériques
  numeric_cols <- data[sapply(data, is.numeric)]
  # Calcul des moyennes
  moyennes <- colMeans(numeric_cols, na.rm = TRUE)
  print('Moyennes des colonnes numériques :')
  print(moyennes)
} else {
  print('Erreur : Le fichier SRCV2025.csv est introuvable.')
}
ONYXIA_FILE_7b1e99ffa287

