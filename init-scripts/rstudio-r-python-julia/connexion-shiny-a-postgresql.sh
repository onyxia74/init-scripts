#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: connexion shiny a postgresql
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_107dbc2a0135'
library(shiny)
library(DBI)
library(RPostgres)

# Configuration de la connexion
# Note: Dans Onyxia, les services sont dans le même namespace.
# L'hôte sera le nom du service postgresql (ex: postgresql-cnpg)

ui <- fluidPage(
  titlePanel("Test Connexion PostgreSQL"),
  sidebarLayout(
    sidebarPanel(
      actionButton("connect", "Tester la connexion")
    ),
    mainPanel(
      verbatimTextOutput("status")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$connect, {
    tryCatch({
      con <- dbConnect(
        RPostgres::Postgres(),
        dbname = 'defaultdb',
        host = 'postgresql-cnpg',
        port = 5432,
        user = 'changeme',
        password = 'changeme'
      )
      dbDisconnect(con)
      output$status <- renderPrint({"Connexion réussie !"})
    }, error = function(e) {
      output$status <- renderPrint({"Erreur : " %*% e$message})
    })
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_107dbc2a0135

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'DBI'"'"', '"'"'RPostgres'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

