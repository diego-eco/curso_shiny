# Curso Curso Shiny Apps & R 

**Repositorio del curso.**


El curso tiene como objetivo proporcionar herramientas para el desarrollo de una aplicación web basada en lenguaje *R* a través de la librería *Shiny*. Se proporcionan conceptos básicos de desarrollo web, estructura básica de una aplicación Shiny, visualización interactiva de datos y herramientas complementarias para el desarrollo en equipo. Al final de curso el estudiante será capaz de desplegar en la web una aplicación Shiny con visualización interactiva de datos utilizando las herramientas de [shinydashboard.](https://rstudio.github.io/shinydashboard/index.html)

El curso está estructurado en 6 sesiones en línea. (12 horas en total)


Requisitos:
- Windows/Mac con R, RStudio, cuenta y distribución de Github (Github Desktop, Sourcetree, GitKraken). Ver documento con instrucciones de instalación paso a paso.

## Día 1 Viernes 23 de abril

* R necesario para implementar Shiny Apps: 
  + Importar una base de datos (csv, xls, dta).
  + Manipulación de dataframes con *tidyverse*.
  + Visualización a través de la librería *ggplot/plotly*.
* Gráficas interactivas con plotly.
* Revisión de [Shiny App muestra](https://diego-lopezt.shinyapps.io/Poblacion_Economia/): Elementos, capacidades y limitaciones de Shiny.

## Día 2 Viernes 30 de abril

* Conceptos y estructura de un sitio web:
  + Host, Server, Frontend, Backend
* Estructura de archivos de Shiny App: UI, Server, app, global, css.
* Creación de repositorio en Github y *commit* de R project de Shiny App vacía.

## Día 3 Viernes 7 de mayo

* Funciones básicas de Shiny: Convirtiendo R a HTML.
* Introducción a *shinydashboard:* Estructura general: Header, Sidebar & Body.
* Layout de aplicación: Navlist y Grid Layout.
* Creación de primer Shiny App. Página de bienvenida.

## Día 4 Viernes 14 de mayo

* Importando y almacenando en server base de dato: Buenas prácticas.
* Render de gráficas estáticas con ggplot.
* Render de gráficas interactivas con plotly.
* Tablas interactivas con DT.

## Día 5 Viernes 21 de mayo

* Controles y entrada de usuario: Select, slider, input.
* Funciones reactivas: `server(input, output)`. [Ejemplo](https://shiny.rstudio.com/gallery/single-file-shiny-app.html)
* Contexto reactivo.
* Funciones render y output.

## Día 6 Viernes 28 de mayo

* Integrando input, output: Buenas prácticas de manejo de funciones reactivas.
* Personalizando *shinydashboard* e incorporando CSS externo (plantillas).
* Shiny App: Gráficos con input de usuario. [Ejemplo](https://diego-lopezt.shinyapps.io/Mapas_ENSANUT/)
* Consejos y recomendaciones para el aprendizaje autónomo.