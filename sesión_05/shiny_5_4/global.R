
library(tidyverse)
library(dashboardthemes)
library(shinyWidgets)
library(plotly)
library(haven)
library(readxl)
library(DT)
library(rdrop2)

source("custom_theme.R")

linebreaks <- function(n){HTML(strrep(br(), n))}

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


