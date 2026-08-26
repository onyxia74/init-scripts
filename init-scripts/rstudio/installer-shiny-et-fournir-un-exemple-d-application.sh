#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Installer shiny et fournir un exemple d'application
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_382b97b1567b'
library(shiny)

ui <- fluidPage(
  titlePanel('Hello Shiny!'),
  sidebarLayout(
    sidebarPanel(
      sliderInput('obs', 'Nombre d\'observations:', min = 0, max = 1000, value = 500)
    ),
    mainPanel(
      plotOutput('distPlot')
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), col = 'darkgray', border = 'white')
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_382b97b1567b

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

