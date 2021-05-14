
library(shiny)
library(shinymanager)
library(shinythemes)


# define some credentials

credentials <- data.frame(
  user = c("shiny", "shinymanager"), # mandatory
  password = c("azerty", "12345"), # mandatory
  start = c("2019-04-15"), # optinal (all others)
  expire = c(NA, "2019-12-31"),
  admin = c(FALSE, TRUE),
  stringsAsFactors = FALSE
)


ui <- fluidPage(
  tags$h2("My secure application"),
  verbatimTextOutput("auth_output")
)

# Wrap your UI with secure_app
ui <- secure_app(ui,theme = shinytheme("cerulean"),language = "es")


server <- function(input, output) {
  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
}


# Corremos la aplicación ----

shinyApp(ui = ui, server = server)
