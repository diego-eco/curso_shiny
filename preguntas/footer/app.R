## app.R ##
library(shiny)
library(shinydashboard)

dbHeader <- dashboardHeader(title = "Bienvenidos",
                            tags$li(a(href = 'https://www.gob.mx/',
                                      img(src = 'gob.png',
                                          title = "Gobierno México", height = "30px"),
                                      style = "padding-top:10px; padding-bottom:10px;"),
                                    class = "dropdown"),
                            tags$li(a(href = 'https://www.gob.mx/se',
                                      img(src = 'se.png',
                                          title = "Sec Economía", height = "30px"),
                                      style = "padding-top:10px; padding-bottom:10px;"),
                                    class = "dropdown"))

ui <- dashboardPage(
  dbHeader,
  dashboardSidebar(
    sidebarMenu(
      h5("Sistema de información económica", align = "center"),
      menuItem("Inicio", tabName = "inicio", icon = icon("home")),
      menuItem("Objetivos Prioritarios", icon = icon("info"), startExpanded = FALSE,
               menuSubItem("Objetivo Prioritario 1 ", tabName = "obj1"),
               menuSubItem("Objetivo Prioritario 2", tabName = "obj2")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "inicio",
              navbarPage("", position = "fixed-bottom",
                         inverse = TRUE,collapsible = TRUE,
                         tabPanel("Bienvenido", "Contenido de bienvenido"),
                         tabPanel("Términos de uso", "Contenido de términos"),
                         tabPanel("Licencia Código Abierto", "Contenido de licencia"),
                         navbarMenu("Ayuda",
                                    tabPanel("Instrucciones de uso",
                                             "Contenido de Instrucc"),
                                    tabPanel("Solicitud de datos",
                                             "Contenido de solicitud")),
                         tabPanel("Preguntas frecuentes", "Contenido de preguntas"),
                         tabPanel("Contacto", "Contenido de contacto")
              )
      ),
      
      tabItem(tabName = "obj1",
              h2("Objetivo Prioritario 1"),
              navlistPanel(
                tabPanel("Panel 1",
                         navlistPanel(
                           tabPanel("Panel 1a","Contenido del subpanel 1"),
                           tabPanel("Panel 2a","Contenido del subpanel 2"),
                           tabPanel("Panel 3a","Contenido del subpanel 3")
                         )
                ),
                tabPanel("Panel 2","Contenido del panel 2"),
                tabPanel("Panel 3","Contenido del panel 3")
              )
      ),
      
      tabItem(tabName = "obj2",
              h2("Objetivo Prioritario 2")
      )
    )
  )
)

server <- function(input, output) { }

shinyApp(ui, server)