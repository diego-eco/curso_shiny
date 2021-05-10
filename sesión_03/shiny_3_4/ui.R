
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
                            tabPanel("Pestaña 1"),
                            tabPanel("Pestaña 2"),
                            tabPanel("Pestaña 3")
                        )
                ),
                
                tabItem(tabName = "briefcase",
                        h2("Esta es la sección de empleo"),
                        tabsetPanel(
                            tabPanel("Pestaña 1",
                                sidebarLayout(
                                sidebarPanel("Panel lateral"),
                                mainPanel("Panel principal")
                            )),
                            tabPanel("Pestaña 2"),
                            tabPanel("Pestaña 3")
                        )
                        
                ),
                
                tabItem(tabName = "industry",
                        h2("Esta es la sección de producto"),
                        fluidRow( 
                            column(9,
                                   h5(style="text-align: justify;","La estructura es la siguiente:",br(),
                                        br(),"Para comenzar, presentamos ...",br(),
                 br(),"En segundo lugar...",br(),
                 br(),"Posteriormente, ...",br(),
                 br(),"Enseguida ... ",
                 "Finalmente ..."
                            )
                            ),
                 column(3,box(
                     title = "¿Sabías qué?", width = NULL, solidHeader = TRUE, status = "warning",
                     p(align="center","\"En 2019, la esperanza de vida de las personas en México es de 
                       75.1 años en promedio y para 2030 se estima que sea de 76.7 años.")
                 )
                 )
                        )
                ),
                tabItem(tabName = "team",
                        h1("Secretaría de Economía", align = "center"),
                        br(),
                        fluidRow(
                            box(background = "navy",
                                h4(strong("Joel Castillo Espinosa"),align="center"),width = 4,
                                br(),
                                HTML('<center ><img src="joel.png" width="100"></center>'),
                                br(),
                                a("jocastillo@colmex.mx", href = "mailto:jocastillo@colmex.mx"),br(),
                                a("@Joel_caes", href = "https://twitter.com/Joel_caes"),align="center"),
                            box(h4(strong("Williams Gómez Cerino"),align="center"),width = 4,
                                br(),
                                HTML('<center><img src="will.png" width="100"></center>'),
                                br(),
                                a("wgomez@colmex.mx", href = "mailto:wgomez@colmex.mx"),align="center"),
                            box(h4(strong("Diego López Tamayo "),align="center"),width = 4,
                                br(),
                                HTML('<center><img src="diego.png" width="100"></center>'),
                                br(),
                                a("diego.lopez@colmex.mx", href = "mailto:diego.lopez@colmex.mx"),br(),
                                a("@diego_lopezt", href = "https://twitter.com/diego_lopezt"),
                                align="center")
                            
                        ),
                        br(),
                        HTML('<center><img src="se.png" width="100"></center>'),
                        br(),
                        h5("Este proyecto de visualización de datos se realizó con la paquetería 
                           de Shiny en lenguaje R con datos abiertos de Inegi, Conapo, Imss 
                           y el Banco Mundial.
                           Está abierto a todo público, encontrará la documentación, bases de datos
                           y scripts en el siguiente", strong("Gracias por su visita."),align = "center")
                )
            )
        )
    )
)

