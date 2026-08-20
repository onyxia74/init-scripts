#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"rstudio-r-python-julia","packages":["shiny","DBI","RPostgres"],"purpose":"test connection to postgresql","files":{"connection_test.R":"library(DBI)
library(RPostgres)

# Note: The host, port, dbname, user and password 
# will be automatically available via environment variables 
# or discovery if configured.

print("Attempting to connect to PostgreSQL...")
tryCatch({
  con <- dbConnect(RPostgres::Postgres(),
                   host = Sys.getenv("POSTGRESQL_HOST"),
                   port = as.integer(Sys.getenv("POSTGRESQL_PORT")),
                   dbname = Sys.getenv("POSTGRESQL_DATABASE"),
                   user = Sys.getenv("POSTGRESQL_USER"),
                   password = Sys.getenv("POSTGRESQL_PASSWORD"))
  
  print("Connection successful!")
  print(dbListTables(con))
  dbDisconnect(con)
}, error = function(e) {
  print(paste("Connection failed:", e$message))
})"},"start_command":"Rscript connection_test.R"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
