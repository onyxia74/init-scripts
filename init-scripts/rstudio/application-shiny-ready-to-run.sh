#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Application Shiny ready-to-run
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_66fb6fb6d9af'
library(shiny)

ui <- fluidPage(
  titlePanel('Hello Shiny!'),
  sidebarLayout(
    sidebarPanel(
      sliderInput('obs', 'Nombre d'observations:', min = 10, max = 1000, value = 500)
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
ONYXIA_FILE_66fb6fb6d9af

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'shinydashboard'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_85eca4fee2bb'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
R -e 'shiny::runApp("/home/onyxia/work/app.R", port=8080, host="0.0.0.0")'
ONYXIA_FILE_85eca4fee2bb
chmod +x "${WORK_DIR}/onyxia/run.sh"

