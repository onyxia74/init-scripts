#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: déploiement d une application Shiny avec des librairies de visualisation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_26c6ff62a171'
library(shiny)
library(leaflet)

ui <- fluidPage(
  titlePanel("Ma première application Shiny sur Onyxia"),
  sidebarLayout(
    sidebarPanel(
      helpText("Bienvenue dans votre environnement Shiny !")
    ),
    mainPanel(
      leafletOutput("map")
    )
  )
)

server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 2.35, lat = 48.85, zoom = 10)
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_26c6ff62a171

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'leaflet'"'"', '"'"'shinythemes'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_99286366b8ee'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
Rscript -e "shiny::runApp(\'app.R\', host=\'0.0.0.0\', port=8787)"
ONYXIA_FILE_99286366b8ee
chmod +x "${WORK_DIR}/onyxia/run.sh"

