
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

variables <- colnames(data)[-1]


# A partir de aquí el server

server <- function(input, output) {
  
  
  tendencia_data <- reactive({
    tendencia<-data%>%dplyr::select(Periodo,input$selec_var)
    names(tendencia)<-c("year","selected_var")
    tendencia
  })
  
  output$plot1_ly <- renderPlotly({
    plot_ly(tendencia_data()) %>%
      add_trace(tendencia_data(), x = ~year, y = ~selected_var,
                type = 'scatter', mode = 'lines')%>%
      layout(title = paste("México 2005 - 2021 Porcentaje %",input$selec_var),
             xaxis = list(title = ""),
             yaxis = list (title = paste("Porcentaje %",input$selec_var)))%>%
      layout(yaxis = list(titlefont = list(size = 10), tickfont = list(size = 10)) ) 
  })
  
  # https://cran.r-project.org/web/packages/DT/DT.pdf
  
  tendencia_tabla <- reactive({
    tendencia<-data%>%dplyr::select(Periodo,input$selec_var2)
    tendencia
  })
  
  
  output$data_dt = renderDT(
    tendencia_tabla(),
    class = "compact",  # display, cell-border, compact , hover, stripe
    caption = "Tabla 1", # "Tabla 1", NULL
    style = "bootstrap4", # 'auto', 'default', 'bootstrap', or 'bootstrap4'
    width = NULL
  )
  
}
