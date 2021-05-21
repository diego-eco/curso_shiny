
# Llamamos librerías y bases de datos

library(tidyverse)
library(plotly)
library(DT)
library(palmerpenguins)


data("penguins")
force(penguins)
data <- read_csv("www/base_limpia.csv")

linebreaks <- function(n){HTML(strrep(br(), n))}

# A partir de aquí el server

server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
      geom_point(aes(color = species, shape = species), size=2) +
      labs(x = "Largo de pico", y = "Ancho de pico",
           title="Gráfico de dispersión", subtitle="Ancho y largo del pico",
           col = "Especies", shape = "Especies")+ 
      theme_minimal() 
  })
  
  output$data_brush <- renderTable({
    brushedPoints(penguins, input$plot_brush)
  })

# https://gallery.shinyapps.io/109-render-table/?_ga=2.111699266.774457467.1620950058-2046146017.1610590679
# https://shiny.rstudio.com/reference/shiny/latest/renderTable.html
  
  output$data <- renderTable({
    head(penguins)
    # penguins %>% group_by(island) %>% 
    # summarise(masa_corporal_promedio = mean(body_mass_g, na.rm=TRUE), numero_pinguinos = n())
  },  
  striped = TRUE, bordered = TRUE,  
  hover = TRUE,spacing = c("xs")
  )
  
  output$plot1_ly <- renderPlotly({
    plot_ly(data = penguins, x = ~bill_length_mm, y = ~bill_depth_mm, type = 'scatter',
            color = ~species, symbol = ~species,marker = list(size=10)) %>% 
      layout(title = 'Gráfico de dispersión. Ancho y largo del pico',
             yaxis = list(title = "Largo de pico"),xaxis = list(title = "Ancho de pico"))
  })
  
# https://cran.r-project.org/web/packages/DT/DT.pdf
  
  output$data_dt1 = renderDT(
    penguins,
    class = "compact",  # display, cell-border, compact , hover, stripe
    caption = "Tabla 1", # "Tabla 1", NULL
    style = "bootstrap4", # 'auto', 'default', 'bootstrap', or 'bootstrap4'
    width = NULL
  )
  
  output$data_dt2 = renderDT(
    penguins,
    class = "hover",  # display, cell-border, compact , hover, stripe
    caption = "Tabla 1", # "Tabla 1", NULL
    style = "auto", # 'auto', 'default', 'bootstrap', or 'bootstrap4'
    width = NULL
  )
  
}
