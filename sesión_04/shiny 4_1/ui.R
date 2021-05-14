
library(shiny)


fluidPage(
    
    titlePanel("Sesión 4 No user input"),
    
    navlistPanel(widths = c(2, 10),
        "Gráficas",
        tabPanel("ggplot",
                 
                 
                 
                 ),
        
        tabPanel("plotly",
                 
                 
                 
                 ),
        
        "-----",
        
        "Tablas",
        
        tabPanel("Estáticas",
                 
                 
                 ),
        
        tabPanel("Interactivas",
                 
                 
                 )
    )
)