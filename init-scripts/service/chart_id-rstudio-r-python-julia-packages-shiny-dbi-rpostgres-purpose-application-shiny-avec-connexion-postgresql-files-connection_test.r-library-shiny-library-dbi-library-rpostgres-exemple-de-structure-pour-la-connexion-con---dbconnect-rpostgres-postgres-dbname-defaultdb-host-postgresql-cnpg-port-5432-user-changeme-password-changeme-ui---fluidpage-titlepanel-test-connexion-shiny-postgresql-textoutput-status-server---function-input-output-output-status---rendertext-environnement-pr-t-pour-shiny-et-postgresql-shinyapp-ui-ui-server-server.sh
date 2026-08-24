#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"rstudio-r-python-julia","packages":["shiny","DBI","RPostgres"],"purpose":"application Shiny avec connexion PostgreSQL","files":{"connection_test.R":"library(shiny)
library(DBI)
library(RPostgres)

# Exemple de structure pour la connexion
# con <- dbConnect(RPostgres::Postgres(),
#                 dbname = "defaultdb",
#                 host = "postgresql-cnpg",
#                 port = 5432,
#                 user = "changeme",
#                 password = "changeme")

ui <- fluidPage(
  titlePanel("Test Connexion Shiny-PostgreSQL"),
  textOutput("status")
)

server <- function(input, output) {
  output$status <- renderText({
    "Environnement prêt pour Shiny et PostgreSQL"
  })
}

shinyApp(ui = ui, server = server)"}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
