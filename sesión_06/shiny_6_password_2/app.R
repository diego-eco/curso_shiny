# 1 - SET THE SCENE
# load required packages 
library(shiny)          # web app framework 
library(shinyjs)        # improve user experience with JavaScript
library(tidyverse)      # data manipulation
library(shinydashboard)
library(shinythemes)

# 2 - UI PART
# app backbone
ui <- navbarPage(
  title = "Sistema de Monitoreo Institucional",
  collapsible = TRUE,
  windowTitle = "Sistema SE",
  theme = shinytheme("united"),
  tabPanel(
    title = "Bienvenido",
    useShinyjs(),
    div(
      id = "login-basic", 
      style = "width: 500px; max-width: 100%; margin: 0 auto;",
      
      div(
        class = "well",
        h4(class = "text-center", "Acceso"),
        p(class = "text-center", 
          tags$small("Por favor introduzca sus credenciales.")
        ),
        
        textInput(
          inputId     = "ti_user_name_basic", 
          label       = tagList(icon("user"), 
                                "Usuario"),
          placeholder = "diego.lopez@economia.com"
        ),
        
        passwordInput(
          inputId     = "ti_password_basic", 
          label       = tagList(icon("unlock-alt"), 
                                "Contraseña"), 
          placeholder = "******"
        ), 
        
        div(
          class = "text-center",
          actionButton(
            inputId = "ab_login_button_basic", 
            label = "Acceso",
            class = "btn-primary"
          )
        ),
        br(),
        br(),
        HTML('<center><img src="se.png" width="300"></center>')
      )
    ),
    
    uiOutput(outputId = "display_content_basic")
    
  )
)

# 3 - SERVER PART
server <- function(input, output, session) {
  
  # section 3.1 - server logic for BASIC AUTHENTICATION ----
  
  # section 3.1.1 - create userbase for basic authentication ----
  user_base_basic_tbl <- tibble(
    user_name = "masha",
    password  = "123"
  )
  
  # section 3.1.2 - check credentials vs tibble ----
  validate_password_basic <- eventReactive(input$ab_login_button_basic, {
    
    validate <- FALSE
    
    if (input$ti_user_name_basic == user_base_basic_tbl$user_name &&
        input$ti_password_basic == user_base_basic_tbl$password) {
      validate <- TRUE
    }
  })
  
  # section 3.1.3 - hide form ----
  observeEvent(validate_password_basic(), {
    shinyjs::hide(id = "login-basic")
  })
  
  # section 3.1.4 - app ----
  output$display_content_basic <- renderUI({
    
    req(validate_password_basic())
    
    dashboardPage(
      dashboardHeader(),
      dashboardSidebar(
        sidebarMenu(
          h5("Sistema de información económica", align = "center"),
          menuItem("Inicio", tabName = "inicio", icon = icon("home")),
          menuItem("Objetivos Prioritarios",
                   icon = icon("info"), startExpanded = FALSE,
                   menuSubItem("Objetivo Prioritario 1 ", tabName = "obj1"),
                   menuSubItem("Objetivo Prioritario 2", tabName = "obj2")
          )
        )
      ),
      dashboardBody()
    )
    
  })
  
}
# 4 - RUN APP
shinyApp(ui = ui, server = server)

