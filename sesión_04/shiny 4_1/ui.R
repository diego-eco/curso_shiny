
library(shiny)


fluidPage(
    
    titlePanel("Sesión 4 No user input"),
    
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
                 
                 h1("Gráfica plotly"),
                 hr(),
                 linebreaks(3),
                 plotlyOutput("plot1_ly")
                 ),
        
        "-----",
        
        "Tablas",
        
        tabPanel("Estáticas",
                 
                 h1("Nuestra primer tabla"),
                 hr(),
                 linebreaks(3),
                 tableOutput("data")
                 ),
        
        tabPanel("Interactivas",
                 h1("Nuestra primer tabla interactiva"),
                 hr(),
                 linebreaks(3),
                 DTOutput("data_dt")
                 )
    )
)
