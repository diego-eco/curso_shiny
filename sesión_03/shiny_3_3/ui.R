
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
            menuItem("Objetivos", tabName = "objetivos", icon = icon("bullseye")),
            menuItem("Info económica", icon = icon("info"), startExpanded = FALSE,
                     menuSubItem("Empleo", tabName = "briefcase"),
                     menuSubItem("Producto", tabName = "industry")
            ),
            menuItem("Sobre nosotros", tabName = "team", icon = icon("users"))
            )
        ),
        dashboardBody(
            tabItems(
                tabItem(tabName = "inicio",
                        h2("Esta es la sección de inicio"),
                        sidebarLayout(
                            sidebarPanel("Panel lateral"),
                            mainPanel("Panel principal")
                        )
                ),
                
                tabItem(tabName = "objetivos",
                        h2("Esta es la sección de objetivos"),
                        tabsetPanel(
                            tabPanel("Panel 1"),
                            tabPanel("Panel 2"),
                            tabPanel("Panel 3")
                        )
                ),
                
                tabItem(tabName = "briefcase",
                        h2("Esta es la sección de empleo")
                ),
                
                tabItem(tabName = "industry",
                        h2("Esta es la sección de producto")
                )
            )
        )
    )
)

