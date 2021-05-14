
library(shiny)
library(shinydashboard)

fluidPage(
    
    titlePanel("Sesión 4 User input"),
    
    navlistPanel(widths = c(2, 10),
        "Gráficas",
        tabPanel("plotly",
                 h2("Nuestra primer gráfica interactiva con input de usuario"),
                 hr(),
                 linebreaks(1),
                 selectInput("selec_var", label = h4("Variable"), 
                             choices = variables, # c("Desempleo","Inflación"), 
                             selected = 1),
                 linebreaks(1),
                 plotlyOutput("plot1_ly")
                 ),
        
        "-----",
        
        "Tablas",
        
        tabPanel("Interactivas",
                 h2("Nuestra primer tabla interactiva con input de usuario"),
                 hr(),
                 linebreaks(1),
                 selectInput("selec_var2", label = h4("Variable"), 
                             choices = variables, # c("Desempleo","Inflación"), 
                             selected = 1),
                 linebreaks(1),
                 DTOutput('data_dt')
                 )
    )
)