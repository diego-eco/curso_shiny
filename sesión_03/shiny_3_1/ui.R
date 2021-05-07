

library(shiny)

#  Interfaz del usuario (ui) Front End ----

shinyUI(fluidPage(
    theme = "bootswatch-cerulean.css",
    titlePanel("Sistema de información SE"),
    tabsetPanel(
        tabPanel("Primer tabPanel",
                 sidebarLayout(position = "right",
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
                 ),
        tabPanel("Segundo tabPanel",
                 h1("Primer nivel"),
                 h2("Segundo nivel"),
                 h3("Tercer nivel"),
                 h4("Cuarto nivel "),
                 h5("Quinto nivel, centrado", align = "center"),
                 h6("Sexto nivel a la derecha", align = "right"),
                 p("p creates a paragraph of text."),
                 p("A new p() command starts a new paragraph.
              Supply a style attribute to change the format of 
              the entire paragraph.", style = "font-family: 'times'; font-si16pt"),
              strong("strong() makes bold text."),
              em("em() creates italicized (i.e, emphasized) text."),
              br(),
              code("code displays your text similar to computer code"),
              div("div creates segments of text with a similar style.
                This division of text is all blue because I passed the
                argument 'style = color:blue' to div", style = "color:blue"),
              br(),
              p("span does the same thing as div, but it works with",
                span("groups of words", style = "color:blue"),
                "that appear inside a paragraph."),
              img(src = "imagen.jpg", height = 300, width = 400)
                 )
    )
    
)
)
