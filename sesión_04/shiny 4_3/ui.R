
library(shiny)
library(shinydashboard)

fluidPage(
    
    titlePanel("Sesión 4 No user input Funciones extra"),
    
    navlistPanel(widths = c(2, 10),
        "Gráficas",
        tabPanel("ggplot",
                 h1("Nuestra primer gráfica"),
                 hr(),
                 linebreaks(3),
                 plotOutput("plot1", brush = "plot_brush"),
                 tableOutput("data_brush")
                 ),
        
        tabPanel("plotly",
                 h1("Nuestra primer gráfica interactiva"),
                 hr(),
                 linebreaks(1),
                 tabsetPanel(
                     tabPanel("Gráfica",linebreaks(1),plotlyOutput("plot1_ly")),
                     tabPanel("Datos",linebreaks(1),DTOutput('data_dt'))
                 )
                 ),
        
        "-----",
        
        "Tablas",
        
        tabPanel("Estáticas",
                 h1("Nuestra primer tabla"),
                 hr(),
                 linebreaks(3),
                 tableOutput("dat")
                 ),
        
        tabPanel("Interactivas",
                 h1("Nuestra primer tabla interactiva"),
                 hr(),
                 linebreaks(1),
                 DTOutput('data_d')
                 )
    )
)