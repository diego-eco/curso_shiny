library(shiny)


#  Interfaz del usuario (ui) Front End ----

ui <- fluidPage()


# Servidor (server) Back End ----

server <- function(input, output) {}


# Corremos la aplicación ----

shinyApp(ui = ui, server = server)