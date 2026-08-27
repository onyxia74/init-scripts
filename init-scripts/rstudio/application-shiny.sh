#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Application Shiny
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_ce233645f75e'
library(shiny)

ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Nombre d'observations:", min = 0, max = 1000, value = 500)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), col = 'darkgray', border = 'white')
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_ce233645f75e

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_4fb7f0be7f80'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
Rscript app.R
ONYXIA_FILE_4fb7f0be7f80
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Start the prepared project in the background.
mkdir -p "${WORK_DIR}/.onyxia"
nohup bash "${WORK_DIR}/onyxia/run.sh" > "${WORK_DIR}/.onyxia/run.log" 2>&1 &

