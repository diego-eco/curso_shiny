
# Llamamos librerías y bases de datos

library(tidyverse)
library(plotly)
library(DT)
library(haven)
library(readxl)
library(rdrop2)


# Bases de datos para glosario
glosario_pob<-read_csv("www/glosario_pob.csv")

# Bases de datos para gráficas internacionales
internacionales<-read_csv("www/country_internacional.csv")
internacionales$year <- as.Date(paste0(internacionales$year, '-01-01'))

# Bases de datos para matrimonios
matrimonios_anio <- read_excel("www/matrimonio_diego1.xls")
names_matrimonio <- colnames(matrimonios_anio)[-1]
matrimonios_tipo_anio <- read_excel("www/pastel_diego_matrimonios.xls")

# Bases de datos mortalidad
mort_sexo_anio <- read_excel("www/Mortalidad_sexo_anio.xls")

# Bases de datos inflación desempleo desde Dropbox

token <- readRDS("www/token.rds")
drop_acc(dtoken = token)
data <- drop_read_csv("base_limpia.csv",dtoken=token)
variables <- colnames(data)[-1]



# A partir de aquí el server

shinyServer(function(input, output) {
  
  # Tab 0
  
  output$plot0 <- renderPlot({
    hist(runif(input$n))
  })
  
  
  # Tab 1
  output$glosario_pob_var <- renderText({ 
    selec_conc_pob <- input$select_conceptos_pob
    glosario_pob_display <- glosario_pob%>%filter(concepto==selec_conc_pob)
    paste(glosario_pob_display$def[1])
  })
  
  # Tab 2

  selectedData_inter <- reactive({
    internacional_sel<-internacionales%>%dplyr::filter(serie==input$var1_inter)
  })

  output$plot1_internacional <- renderPlotly({
    plot_ly(selectedData_inter()) %>%
      add_trace(selectedData_inter(), x = ~year, y = ~México,
                type = 'scatter', mode = 'lines',name = "México") %>%
      add_trace(selectedData_inter(), x = ~year, y = ~USA,
                type = 'scatter', mode = 'lines',name = "USA")%>%
      layout(title = "",
             xaxis = list(title = ""),
             yaxis = list (title = input$var1_inter))%>%
      layout(yaxis = list(titlefont = list(size = 10), tickfont = list(size = 10)) ) %>% layout(legend = list(orientation = 'h'))
  })

  
  # Tab 3
  
  matrim_selec <- reactive({
    matrim_sel <-matrimonios_tipo_anio%>%
      dplyr::filter(year==input$matrimonios_anio,clase==input$matrimonios_clase)
  })
  
  
  
  # Gráfico Pastel matrimonios1
  output$matrimonios1 <- renderPlotly({
    plot_ly(matrim_selec(), labels = ~tipo, values =~matrimonios, type = 'pie') %>%
      layout(title = '',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))%>% layout(legend = list(orientation = 'h'))
  })
  
  
  # Tab 4
  
  # Gráfico 1 (barras por sexo)
  output$mort_sex <- renderPlotly({
    plot_ly(mort_sexo_anio) %>%
      add_bars(mort_sexo_anio,y = ~mort_hom, x=~year, name = 'Muertes hombres', mode='bar') %>% 
      add_bars(mort_sexo_anio,y = ~mort_muj, x=~year, name = 'Muertes mujeres', mode='bar') %>%
      layout(yaxis = list(title = 'Personas'),  
             xaxis = list(title = " ",range = input$mort_sexo_rango), barmode = 'stack')  %>% layout(legend = list(orientation = 'h'))
  })
  
  # Gráfico 2 (tendencia por sexo)
  output$tasa_sex <- renderPlotly({
    plot_ly(mort_sexo_anio) %>%
      add_trace(mort_sexo_anio, x = ~year, y = ~tasa_mor_m, mode = 'lines',name = "Mujeres")%>%
      add_trace(mort_sexo_anio, x = ~year, y = ~tasa_mor_h, mode = 'lines',name = "Hombres")%>%
      add_trace(mort_sexo_anio, x = ~year, y = ~tasa_mor_nac, mode = 'lines',name = "Nacional")%>%
      layout(title = "",
             xaxis = list(title = " ",range = input$mort_sexo_rango),
             yaxis = list (title = "Muertes por cada 100,000 personas"))  %>% layout(legend = list(orientation = 'h'))
    
  })
  
  # Tab 5
  
  tendencia_data <- reactive({
    tendencia<-data[, c("Periodo", input$checkGroup)]
    tendencia
  })

  output$data_dt = renderDT(
    tendencia_data(),
    class = "compact",  # display, cell-border, compact , hover, stripe
    caption = "Tabla 1", # "Tabla 1", NULL
    style = "bootstrap4", # 'auto', 'default', 'bootstrap', or 'bootstrap4'
    width = NULL
  )
  
})










