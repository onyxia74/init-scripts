#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Créer une application Shiny de démonstration avec les dépendances nécessaires.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_6ac0d98459fa'
library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Basic Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    box(title = "Controls", sliderInput("slider", "Number of observations:", 1, 100, 50)),
    plotOutput("plot", height = "250px")
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    hist(rnorm(input$slider), col = 'darkgray', border = 'white')
  })
}

shinyApp(ui = dashboardPage,
         server = server)
ONYXIA_FILE_6ac0d98459fa

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'shinydashboard'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_b6b91cc79f91'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
R -e 'shiny::runApp("app.R")'
ONYXIA_FILE_b6b91cc79f91
chmod +x "${WORK_DIR}/onyxia/run.sh"

