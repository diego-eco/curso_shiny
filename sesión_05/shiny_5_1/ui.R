## app.R ##
library(shiny)
library(shinydashboard)
library(shinyWidgets)

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


dashboardPage(
    dbHeader,
    dashboardSidebar(
        sidebarMenu(
            h5("Input del usuario", align = "center"),
            helpText("Control widgets", align = "center"),
            menuItem("Ejemplo básico", tabName = "tab0"),
            menuItem("Select box texto", tabName = "tab1"),
            menuItem("Select box gráfica", tabName = "tab2"),
            menuItem("Slider", tabName = "tab3"),
            menuItem("Date Range", tabName = "tab4"),
            menuItem("Tablas reactivas", tabName = "tab5")
            )
        ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "tab0",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input

                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado

                        )
                    )
                    
            ),
            tabItem(tabName = "tab1",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input

                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado

                        )
                    )
                    
            ),
            tabItem(tabName = "tab2",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input

                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado

                            
                        )
                    )
                    
            ),
            tabItem(tabName = "tab3",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input
                            
                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado
                            
                            
                        )
                    )
                    
            ),
            tabItem(tabName = "tab4",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input

                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica 1", background  = "navy", width = 6,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado

                            ),
                        box(
                            title = "Gráfica 2", background  = "navy", width = 6,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado

                        )
                    )
                    
            ),
            tabItem(tabName = "tab5",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input

                        )
                    ),
                    fluidRow(
                        box(
                            title = "Tabla", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado

                        )
                    )
                    
            )
        )
    )
)
