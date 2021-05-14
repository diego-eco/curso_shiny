
# Llamamos librerías y bases de datos

library(tidyverse)
library(plotly)
library(DT)
library(rdrop2)

linebreaks <- function(n){HTML(strrep(br(), n))}

# data <- read_csv("www/base_limpia.csv")



token <- readRDS("www/token.rds")
drop_acc(dtoken = token)
data <- drop_read_csv("base_limpia.csv",dtoken=token)



# A partir de aquí el server

server <- function(input, output) {
  
  output$plot1_ly <- renderPlotly({
    plot_ly(data) %>%
      add_trace(data, x = ~Periodo, y = ~Desempleo,
                type = 'scatter', mode = 'lines',name = "Desempleo")%>%
      add_trace(data, x = ~Periodo, y = ~Inflacion,
                type = 'scatter', mode = 'lines',name = "Inflacion") %>%
      layout(title = "\nMéxico: inflación y desempleo, 2005 - 2021",
             xaxis = list(title = ""),
             yaxis = list (title = "Porcentaje %"))%>%
      layout(yaxis = list(titlefont = list(size = 10), tickfont = list(size = 10)) ) 
  })
  
  # https://cran.r-project.org/web/packages/DT/DT.pdf
  
  output$data_dt = renderDT(
    data,
    class = "compact",  # display, cell-border, compact , hover, stripe
    caption = "Tabla 1", # "Tabla 1", NULL
    style = "bootstrap4", # 'auto', 'default', 'bootstrap', or 'bootstrap4'
    width = NULL
  )
  
}
