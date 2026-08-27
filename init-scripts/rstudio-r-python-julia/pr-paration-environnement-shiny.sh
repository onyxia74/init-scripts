#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: préparation environnement Shiny
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_b0b09dea53b6'
library(shiny)

ui <- fluidPage(
  titlePanel("Ma première application Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Nombre d'observations:", min = 1, max = 500, value = 100)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), col = 'skyblue', border = 'white')
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_b0b09dea53b6

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'shinythemes'"'"', '"'"'bslib'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_95a95c53fc24'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
R -e 'shiny::runApp("/home/onyxia/work/app.R", host = "0.0.0.0", port = 8787)'
ONYXIA_FILE_95a95c53fc24
chmod +x "${WORK_DIR}/onyxia/run.sh"

