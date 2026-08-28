#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: deploy a shiny application
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_d7f77ecf8615'
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Shiny Demo"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(title = "Hello Shiny", status = "primary", solidHeader = TRUE, 
          "Welcome to your Shiny application on Onyxia!")
    )
  )
)

server <- function(input, output, session) {
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_d7f77ecf8615

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'shinydashboard'"'"', '"'"'shinythemes'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

