
library(shiny)
library(shinymanager)
library(shinythemes)
library(shinydashboard)
library(tidyverse)

credentials <- data.frame(
  user = c("masha", "joss","gerardo"), # mandatory
  password = c("123", "123","123"), # mandatory
  stringsAsFactors = FALSE
)

# credentials <- read_csv("www/credenciales.csv")

set_labels(
  language = "en",
  "Please authenticate" = "Sistema de Monitoreo Institucional",
  "Username:" = "Usuario",
  "Password:" = "Constraseña",
  "Login" = "Acceso",
  "Username or password are incorrect" =
    "Usuario o contraseña incorrecta",
  "Logout" = "Salir"
)


ui <- dashboardPage(
  dashboardHeader(title = "Bienvenidos"),
  dashboardSidebar(),
  dashboardBody()
)


ui <- secure_app(ui,theme = shinytheme("united"))


server <- function(input, output) {
  
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
  
}


shinyApp(ui = ui, server = server)
