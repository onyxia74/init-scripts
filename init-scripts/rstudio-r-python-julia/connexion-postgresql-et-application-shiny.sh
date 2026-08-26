#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: connexion PostgreSQL et application Shiny
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_26b432d06827'
library(shiny)
library(RPostgres)

# Connexion à PostgreSQL
con <- dbConnect(RPostgres::Postgres(),
               host = 'postgresql-host',
               port = 5432,
               dbname = 'your_db',
               user = 'your_user',
               password = 'your_password')

# Exemple simple
ui <- fluidPage(
  titlePanel("Connexion PostgreSQL"),
  mainPanel(
    h3("Données de la base"),
    verbatimTextOutput("data")
  )
)

server <- function(input, output) {
  output$data <- renderPrint({
    dbGetQuery(con, "SELECT * FROM your_table LIMIT 5")
  })
}

shinyApp(ui, server)
ONYXIA_FILE_26b432d06827
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_513075aa5e26'
# Application Shiny avec PostgreSQL

Cet exemple montre comment connecter une application Shiny à une base PostgreSQL.

## Packages requis
- RPostgres
- DBI
- shiny

## Configuration
Modifiez les paramètres de connexion dans app.R (host, port, dbname, user, password).

## Lancement
Lancez l'application depuis RStudio en exécutant `shiny::runApp()` ou en utilisant le bouton 'Run App'.
ONYXIA_FILE_513075aa5e26

# Install R packages.
Rscript -e 'install.packages(c('"'"'RPostgres'"'"', '"'"'DBI'"'"', '"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_4fb7f0be7f80'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
Rscript app.R
ONYXIA_FILE_4fb7f0be7f80
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Start the prepared project in the background.
mkdir -p "${WORK_DIR}/.onyxia"
nohup bash "${WORK_DIR}/onyxia/run.sh" > "${WORK_DIR}/.onyxia/run.log" 2>&1 &

