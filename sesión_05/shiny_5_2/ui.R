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
                            
                            numericInput('n', 'Number of obs', 200)
                            
                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica/Tabla", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado
                            
                            plotOutput('plot0')
                        )
                    )
                    
            ),
            tabItem(tabName = "tab1",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input
                            helpText("Selecciona un concepto para conocer su definición.
                                     Fuente: Glosario de CONAPO"),
                            selectInput("select_conceptos_pob", label = h4(""), 
                                        choices = glosario_pob$concepto, 
                                        selected = 1)
                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado
                            textOutput("glosario_pob_var")
                        )
                    )
                    
            ),
            tabItem(tabName = "tab2",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input
                            
                            helpText("Seleccione la variable para mostrar. Fuente: Banco Mundial"),
                            selectInput("var1_inter", 
                                        label = "",
                                        choices = internacionales$serie,
                                        selected = 1)
                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado
                            plotlyOutput('plot1_internacional')
                            
                        )
                    )
                    
            ),
            tabItem(tabName = "tab3",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input
                            
                            sliderInput("matrimonios_anio", label = "Año",
                                        min = 2000, max = 2019, value =2000, step=1,
                                        animate=TRUE),
                            selectInput("matrimonios_clase", 
                                        label = "Característica",
                                        choices = matrimonios_tipo_anio$clase,
                                        selected = 1)
                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado
                            
                            plotlyOutput('matrimonios1')
                            
                        )
                    )
                    
            ),
            tabItem(tabName = "tab4",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input
                            
                            helpText("Seleccione el Rango de interés"),
                            sliderInput("mort_sexo_rango", 
                                        label = "Rango",
                                        min = 2000, max = 2018, value = c(2005, 2015))
                        )
                    ),
                    fluidRow(
                        box(
                            title = "Gráfica 1", background  = "navy", width = 6,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado
                            plotlyOutput('mort_sex')
                            ),
                        box(
                            title = "Gráfica 2", background  = "navy", width = 6,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado
                            plotlyOutput('tasa_sex')
                        )
                    )
                    
            ),
            tabItem(tabName = "tab5",
                    fluidRow(
                        box(
                            title = "Inputs", status = "warning", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Input

                            checkboxGroupInput("checkGroup",
                                               label = h3("Seleccione variables a mostrar"), 
                                               choices = list("Desempleo" = "Desempleo",
                                                              "Inflación" = "Inflacion"),
                                               selected = "Desempleo")
                        )
                    ),
                    fluidRow(
                        box(
                            title = "Tabla", background  = "navy", width = 12,
                            solidHeader = TRUE,collapsible = TRUE,
                            #Resultado
                            DTOutput('data_dt')
                        )
                    )
                    
            )
        )
    )
)
