#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Shiny application setup with a basic dashboard example
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_a7d7a1b4b725'
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "My Shiny App"),
  dashboardSidebar(),
  dashboardBody(
    box(title = "Controls", sliderInput("obs", "Number of observations:", min = 0, max = 1000, value = 500)),
    plotOutput("distPlot")
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    dist <- rnorm(input$obs)
    hist(dist, main = paste("Normal", input$obs, "observations"))
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_a7d7a1b4b725

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'shinydashboard'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

