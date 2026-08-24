#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: connexion Shiny vers PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connection_test.R")"
cat > "${WORK_DIR}/connection_test.R" <<'ONYXIA_FILE_3dffaf5fb0af'
library(DBI)
library(RPostgres)

# Exemple de structure de connexion
# con <- dbConnect(RPostgres::Postgres(),
#                  dbname = 'votre_db',
#                  host = 'votre_host',
#                  port = 5432,
#                  user = 'votre_user',
#                  password = 'votre_password')

print('Environnement prêt pour Shiny et PostgreSQL')
ONYXIA_FILE_3dffaf5fb0af

# Install R packages.
Rscript -e 'install.packages(c('"'"'DBI'"'"', '"'"'RPostgres'"'"', '"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_a9319739559d'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
Rscript connection_test.R
ONYXIA_FILE_a9319739559d
chmod +x "${WORK_DIR}/onyxia/run.sh"

