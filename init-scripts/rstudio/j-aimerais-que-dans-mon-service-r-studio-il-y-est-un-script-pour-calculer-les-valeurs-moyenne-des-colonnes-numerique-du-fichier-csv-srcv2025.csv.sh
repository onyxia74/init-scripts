#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: J'aimerais que dans mon service R studio il y est un script pour calculer les valeurs moyenne des colonnes numerique du fichier csv SRCV2025.csv
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/calcul_moyennes.R")"
cat > "${WORK_DIR}/calcul_moyennes.R" <<'ONYXIA_FILE_5ee16b6866eb'
csv_path <- "SRCV2025.csv"
if (!file.exists(csv_path)) {
  stop(paste("Fichier introuvable:", csv_path))
}

donnees <- read.csv(csv_path, stringsAsFactors = FALSE)
colonnes_numeriques <- vapply(donnees, is.numeric, logical(1))

if (!any(colonnes_numeriques)) {
  stop("Aucune colonne numerique trouvee dans le fichier CSV.")
}

moyennes <- sapply(donnees[colonnes_numeriques], mean, na.rm = TRUE)
print(moyennes)
ONYXIA_FILE_5ee16b6866eb

