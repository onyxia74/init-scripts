#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Préparer un environnement RStudio pour le développement et le déploiement d'applications Shiny avec un exemple.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_047fc3b9760c'
library(shiny)

ui <- fluidPage(
  titlePanel('Hello Shiny!'),
  sidebarLayout(
    sidebarPanel(
      sliderInput('obs', 'Nombre d'observations:', min = 0, max = 1000, value = 500)
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
ONYXIA_FILE_047fc3b9760c
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_40cc20a7fd74'
# Application Shiny

1. Ouvrez `app.R` dans RStudio.
2. Cliquez sur le bouton 'Run App' en haut à droite de l'éditeur.
3. L'application s'affichera dans le panneau 'Viewer' ou dans un navigateur.

Packages installés : shiny, shinydashboard, DT, ggplot2.
ONYXIA_FILE_40cc20a7fd74

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'shinydashboard'"'"', '"'"'DT'"'"', '"'"'ggplot2'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

