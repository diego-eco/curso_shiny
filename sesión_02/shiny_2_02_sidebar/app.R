library(shiny)


#  Interfaz del usuario (ui) Front End ----

ui <- fluidPage(
    
    # Título de la aplicación
    titlePanel("Bienvenido a nuestro primer Shiny"),
    
    # sidebarLayout crea una estructura de paneles
    sidebarLayout(
        sidebarPanel("Panel lateral"),
        mainPanel("Panel principal")
    )
)


# Servidor (server) Back End ----

server <- function(input, output) {
    
}



# Corremos la aplicación ----

shinyApp(ui = ui, server = server)



