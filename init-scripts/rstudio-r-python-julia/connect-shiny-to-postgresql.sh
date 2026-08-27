#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: connect shiny to postgresql
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_6ac026a58326'
library(shiny)
library(DBI)
library(RPostgres)

ui <- fluidPage(
  titlePanel("Shiny + PostgreSQL Demo"),
  textOutput("db_status")
)

server <- function(input, output) {
  output$db_status <- renderText({
    # Example connection logic
    # conn <- dbConnect(RPostgres::Postgres(), 
    #                   dbname = 'your_db', 
    #                   host = 'your_host', 
    #                   user = 'your_user', 
    #                   password = 'your_password')
    # dbDisconnect(conn)
    "Ready to connect to PostgreSQL! Use DBI and RPostgres packages."
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_6ac026a58326

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'DBI'"'"', '"'"'RPostgres'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

