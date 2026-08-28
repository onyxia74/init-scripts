#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio-r-python-julia on Onyxia.
# Purpose: Shiny application with PostgreSQL connection setup
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_07379c777c60'
library(shiny)
library(DBI)
library(RPostgres)

ui <- fluidPage(
  titlePanel("Shiny + PostgreSQL"),
  sidebarLayout(
    sidebarPanel(
      textInput("db_host", "Database Host", value = "localhost"),
      textInput("db_name", "Database Name", value = "postgres"),
      textInput("db_user", "Username", value = "postgres"),
      passwordInput("db_password", "Password"),
      actionButton("connect", "Connect")
    ),
    mainPanel(
      verbatimTextOutput("db_status")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$connect, {
    tryCatch({
      con <- dbConnect(
        RPostgres::Postgres(),
        host = input$db_host,
        dbname = input$db_name,
        user = input$db_user,
        password = input$db_password
      )
      dbDisconnect(con)
      output$db_status <- renderPrint({"Successfully connected to PostgreSQL!"})
    }, error = function(e) {
      output$db_status <- renderPrint({"Connection failed:"}), paste(e$message)}
    )
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_07379c777c60

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'DBI'"'"', '"'"'RPostgres'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

