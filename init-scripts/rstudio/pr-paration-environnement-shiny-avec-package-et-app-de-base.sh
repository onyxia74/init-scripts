#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: préparation environnement Shiny avec package et app de base
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_715f6b5b591f'
library(shiny)

ui <- fluidPage(
  "<h1>Hello Shiny!</h1>",
  "<p>Votre application est prête à être développée.</p>"
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_715f6b5b591f

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'


Rscript -e 'install.packages("shiny", repos="https://cloud.r-project.org")'
