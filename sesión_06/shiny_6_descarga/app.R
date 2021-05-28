## app.R ##
library(shiny)
library(shinydashboard)

library(tidyverse)
library(plotly)
library(kableExtra)

# Bases de datos para gráficas internacionales
internacionales<-read_csv("www/country_internacional.csv")
internacionales$year <- as.integer(internacionales$year)
internacionales %>% filter(year >= 2010) -> internacionales
internacionales %>% dplyr::select(serie, year, México, USA) -> internacionales

# Metadatos
internacionales_meta <- read_csv("www/country_internacional_meta.csv")
internacionales_meta <- internacionales_meta[order(internacionales_meta$Concepto),]

ui <- dashboardPage(
  dashboardHeader(title = "Bienvenidos"),
  dashboardSidebar(
    sidebarMenu(
      h5("Sistema de información económica", align = "center"),
      menuItem("Gráfico y tabla", tabName = "inicio", icon = icon("table"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "inicio",
              h2("Esta es la sección de objetivos"),
              tabsetPanel(
                tabPanel("Cuadro y gráfico",
                         br(),
                         fluidRow(column(9, selectInput("var1_inter", 
                                              label = "",
                                              choices = internacionales$serie,
                                              selected = 1)),
                                  column(3,
                                  a(href="country_internacional.csv","Descargar",
                                    download=NA, target="_blank"),
                                  # tags$li(a(href = "country_internacional.csv",
                                            # img(src = 'icon.png',
                                                # title = "download",
                                                # height = "30px"),
                                            # style = "padding-top:10px;
                                            # padding-bottom:10px;"),
                                          # class = "dropdown")
                                  )
                                  ),
                         fluidRow(tableOutput("data_kable")),
                         plotlyOutput('plot1_internacional')),
                
                
                tabPanel("Metadatos",
                         br(),
                         fluidRow(column(3, offset = 9,
                                         a(href="country_internacional_meta.csv",
                                           "Descargar",
                                           download=NA, target="_blank")
                         )),
                         br(),br(),
                         tableOutput("meta"))
              ),
      )
    )
  )
)

server <- function(input, output) {
  
  
  selectedData_inter <- reactive({
    internacional_sel<-internacionales%>%dplyr::filter(serie==input$var1_inter)
  })
  
  output$data <- renderTable({
    selectedData_inter() %>% dplyr::select(year,México,USA) -> tabla
    tabla <- as.data.frame(t(as.matrix(tabla)))
    names(tabla) <- tabla[1,]
    tabla <- tabla[-1,]
    tabla$País <- rownames(tabla)
    tabla %>% relocate(País)-> tabla
    rownames(tabla) <- c()
    tabla
  },  
  striped = TRUE, bordered = TRUE,  
  hover = TRUE,spacing = c("xs"),align = "c"
  )
  
  output$data_kable <- function() {
    selectedData_inter() %>% dplyr::select(year,México,USA) -> tabla
    tabla <- as.data.frame(t(as.matrix(tabla)))
    names(tabla) <- tabla[1,]
    tabla <- tabla[-1,]
    tabla$País <- rownames(tabla)
    tabla %>% relocate(País)-> tabla
    rownames(tabla) <- c()
    tabla %>%
      kable() %>%
      kable_styling("striped", full_width = F) %>%
      row_spec(0, bold = T, color = "white", background = "red")
  }
  
  
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
  
  output$meta <- renderTable({
    head(internacionales_meta)
  },  
  striped = TRUE, bordered = TRUE,  
  hover = TRUE,spacing = c("xs")
  )
  
  
}

shinyApp(ui, server)



















