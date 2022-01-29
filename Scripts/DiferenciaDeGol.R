
# 1 - Objetivo ------------------------------------------------------------

# Estudiar si la diferencia de gol es buen predictor de la posicion final de 
# la temporada siguiente.



# 2 - Librerias -----------------------------------------------------------

paquetes <- list(
  "Tidyverse"     = list("dplyr", "purrr", "httr", "lubridate", "tidyr", "tibble"),
  "Base de Datos" = list("worldfootballR", "readxl"),
  "Graficar"      = list("ggplot2")
)

lapply(
  as.list(
    c(paquetes, recursive = TRUE, use.names = FALSE)),
  function(x) {
    library(x, character.only = TRUE, verbose = FALSE)
  })

rm(list = c("paquetes"))


# 3 - Traigo Informacion --------------------------------------------------

temp_1 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/12-13.csv")
temp_2 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/13-14.csv")
temp_3 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/14-15.csv")
temp_4 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/15-16.csv")
temp_5 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/16-17.csv")
temp_6 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/17-18.csv")
temp_7 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/18-19.csv")
temp_8 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/19-20.csv")
temp_9 <- read.csv2("~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV/20-21.csv")

# total_temporadas <- c(
#   '12.3', '13.14', '14.15', '15.16', '16.17', '17.18', '18.19', '19.20', '20.21'
# )

total_temporadas <- c(
  temp_1, temp_2, temp_3, temp_4, temp_5, temp_6, temp_7, temp_8, temp_9
)

# 4 - Filtro Informacion --------------------------------------------------

temp_1 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")
temp_2 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")
temp_3 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")
temp_4 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")
temp_5 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")
temp_6 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")
temp_7 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")
temp_8 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")
temp_9 %>% 
  group_by(Squad) %>% 
  select("Rk", "Squad", "GD")

# 5 - Crear Ranking Dif Gol -----------------------------------------------

temp_1 %>% 
  arrange(desc(GD)) 
  
  



