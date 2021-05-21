
library(shinydashboard)
library(shiny)

#  Interfaz del usuario (ui) Front End ----

shinyUI(
    dashboardPage(
        dashboardHeader(title = "Bienvenidos"),
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
                        h2("Esta es la sección de inicio")
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
)

