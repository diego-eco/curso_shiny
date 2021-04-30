

library(shiny)

#  Interfaz del usuario (ui) Front End ----

shinyUI(fluidPage(
    
    # Título de la aplicación
    titlePanel("Bienvenido a nuestro primer Shiny"),
    
    # sidebarLayout crea una estructura de paneles
    sidebarLayout(
        sidebarPanel("Panel lateral"),
        mainPanel(
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
))
