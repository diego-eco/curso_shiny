
library(shiny)


ui = fluidPage(
  fluidRow(
    column(12,
           tableOutput('table')
    )
  )
)
  
  
server = function(input, output) {
  output$table <- renderTable(iris)
}


# Corremos la aplicación ----

shinyApp(ui = ui, server = server)
