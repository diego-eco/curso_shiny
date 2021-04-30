

library(shiny)

#  Interfaz del usuario (ui) Front End ----

shinyUI(fluidPage(
    # theme = "bootswatch-cerulean.css",
    titlePanel("Sistema de información SE"),
    tabsetPanel(
        tabPanel("Primer tabPanel",),
        tabPanel("Segundo tabPanel",)
    )
    
)
)
