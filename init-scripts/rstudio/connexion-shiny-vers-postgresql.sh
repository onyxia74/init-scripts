#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: connexion Shiny vers PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connection_test.R")"
cat > "${WORK_DIR}/connection_test.R" <<'ONYXIA_FILE_851da42a5665'
library(DBI)
library(RPostgres)

# Exemple de connexion
# con <- dbConnect(Postgres()
#   dbname = 'defaultdb',
#   host = 'postgresql-cnpg',
#   user = 'changeme',
#   password = 'changeme'
# )

print('Environnement Shiny prêt pour PostgreSQL')
ONYXIA_FILE_851da42a5665

# Install R packages.
Rscript -e 'install.packages(c('"'"'DBI'"'"', '"'"'RPostgres'"'"', '"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_9c60a7be5880'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
R -e 'shiny::runApp("/home/onyxia/work/app.R", host="0.0.0.0", port=8266)'
ONYXIA_FILE_9c60a7be5880
chmod +x "${WORK_DIR}/onyxia/run.sh"

