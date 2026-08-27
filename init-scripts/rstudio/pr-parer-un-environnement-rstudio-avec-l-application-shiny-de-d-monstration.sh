#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Préparer un environnement RStudio avec l'application Shiny de démonstration.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_d4041e7ecb64'
library(shiny)

ui <- fluidPage(
  titlePanel('Hello Shiny!'),
  sidebarLayout(
    sidebarPanel(
      sliderInput('obs', 'Nombre d'observations:', min = 1, max = 1000, value = 500)
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
ONYXIA_FILE_d4041e7ecb64

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

