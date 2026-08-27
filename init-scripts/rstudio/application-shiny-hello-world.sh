#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Application Shiny Hello World
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_04a4b872ba03'
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
    dist <- rnorm(input$obs)
    hist(dist, col = 'darkgray', border = 'white')
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_04a4b872ba03

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_58186408b260'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
R -e "shiny::runApp('app.R', port=3838, host='0.0.0.0')"
ONYXIA_FILE_58186408b260
chmod +x "${WORK_DIR}/onyxia/run.sh"


nohup R -e "shiny::runApp('app.R', port=3838, host='0.0.0.0')" > /tmp/shiny.log 2>&1 &
