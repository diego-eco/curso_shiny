
# Llamamos librerías y bases de datos

library(tidyverse)
library(plotly)
library(DT)
library(palmerpenguins)

data("penguins")
force(penguins)


linebreaks <- function(n){HTML(strrep(br(),n))}



# A partir de aquí el server

shinyServer(function(input, output) {
  
  output$plot1 <- renderPlot({
    ggplot(penguins, aes(x= bill_length_mm , y = bill_depth_mm)) +
      geom_point(aes(color = species)) 
  })
  
  output$data_brush <- renderTable({
    brushedPoints(penguins, input$plot_brush)
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  output$plot1_ly <- renderPlotly({
    plot_ly(data = penguins, x = ~bill_length_mm , y = ~bill_depth_mm, 
            type = "scatter")
  })
  
  output$data <- renderTable({
    penguins %>% group_by(island) %>% summarise(pinguinos = n())
  })
  
  
  output$data_dt <- renderDT(
    penguins,
    class = "stripe", # display, cell-border, stripe
    caption = "Tabla interactiva",
    style = "bootstrap4" # auto, default, bootstrap
  )
  
  
  
})










