#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Application Shiny de démonstration avec histogramme
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_5d33f4d700aa'
library(shiny)
library(ggplot2)

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
    hist(dist, main = "Histogramme de la distribution normale")
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_5d33f4d700aa

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'ggplot2'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_4fb7f0be7f80'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
Rscript app.R
ONYXIA_FILE_4fb7f0be7f80
chmod +x "${WORK_DIR}/onyxia/run.sh"

