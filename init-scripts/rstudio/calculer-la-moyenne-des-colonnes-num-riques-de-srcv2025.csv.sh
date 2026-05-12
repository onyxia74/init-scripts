#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: calculer la moyenne des colonnes numériques de SRCV2025.csv
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/calcul_moyenne.R")"
cat > "${WORK_DIR}/calcul_moyenne.R" <<'ONYXIA_FILE_8e98d64abc71'
# Script pour calculer la moyenne des colonnes numériques
# Le fichier SRCV2025.csv doit être présent dans le répertoire de travail

if (file.exists("SRCV2025.csv")) {
  data <- read.csv("SRCV2025.csv")
  # Sélectionner uniquement les colonnes numériques
  numeric_cols <- data[sapply(data, is.numeric)]
  
  if (ncol(numeric_cols) > 0) {
    means <- colMeans(numeric_cols, na.rm = TRUE)
    print("Moyennes des colonnes numériques :")
    print(means)
  } else {
    print("Aucune colonne numérique trouvée dans le fichier.")
  }
} else {
  print("Erreur : Le fichier SRCV2025.csv est introuvable.")
}
ONYXIA_FILE_8e98d64abc71

