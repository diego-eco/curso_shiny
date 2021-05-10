
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
                        h2("Esta es la sección de industria"),
                        fluidRow(
                            column(9,
                                   h5("La estructura es la siguiente"),
                                   br(),
                                   br(),
                                   "Para comenzar, presentamos ...",
                                   "En segundo lugar...",
                                   "En tercer lugar ..."
                                   ),
                            column(3,
                                   h5("Segundas columnas"),
                                   br(),
                                   br(),
                                   "Para comenzar, presentamos ...",
                                   "En segundo lugar...",
                                   "En tercer lugar ..."
                            )
                        ),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        fluidRow(
                            column(6,
                                   box(title = "Esta es la caja 1", width = NULL, solidHeader = T)
                                   ),
                            column(6,
                                   box(title = "Esta es la caja 2", width = NULL, solidHeader = F)
                                   )
                        )
                )
            )
        )
    )
)

