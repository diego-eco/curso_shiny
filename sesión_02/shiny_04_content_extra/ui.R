

library(shiny)

#  Interfaz del usuario (ui) Front End ----

shinyUI(fluidPage(
    titlePanel("Sistema de información SE"),
    sidebarLayout(
        sidebarPanel(
            h2("Bienvenidos"),
            p("Consulta interactiva de información y programas. Creado con:"),
            code('install.packages("shiny")'),
            br(),
            br(),
            br(),
            br(),
            img(src = "se.png", height = 70, width = 200),
            br(),
            br(),
            "Derechos reservados.", 
            span("RStudio", style = "color:blue")
        ),
        mainPanel(
            h1("Este sitio presenta información económica"),
            p("Creado con herramientas de R Studio y la librería Shiny "),
            br(),
            p("Creapo por el equipo de ",
              a("SE", 
                href = "https://www.gob.mx/se")),
            br(),
            h2("Herramientas"),
            p("- Visualización interactiva de indicadores clave"),
            p("- Este es un sitio  ", 
              strong("privado"),
              " de SE y la información deberá ser únicamente para consulta.")
        )
    )
)
)
