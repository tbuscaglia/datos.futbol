
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

# 4 - Filtro Informacion --------------------------------------------------



temp_1 <- temp_1 %>% 
  select("Rk", "Squad", "GD") %>% 
  group_by(Squad) 
  
temp_2 <- temp_2 %>% 
    select("Rk", "Squad", "GD") %>% 
    group_by(Squad)  
  
temp_3 <- temp_3 %>% 
  select("Rk", "Squad", "GD") %>% 
  group_by(Squad)  
  
temp_4 <- temp_4 %>% 
  select("Rk", "Squad", "GD") %>% 
  group_by(Squad)  
  
temp_5 <- temp_5 %>% 
  select("Rk", "Squad", "GD") %>% 
  group_by(Squad)  
  
temp_6 <- temp_6 %>% 
  select("Rk", "Squad", "GD") %>% 
  group_by(Squad)  
  
temp_7 <- temp_7 %>% 
  select("Rk", "Squad", "GD") %>% 
  group_by(Squad) 
  
temp_8 <- temp_8 %>% 
  select("Rk", "Squad", "GD") %>% 
  group_by(Squad) 
  
temp_9 <- temp_9 %>% 
  select("Rk", "Squad", "GD") %>% 
  group_by(Squad) 
  

# 5 - Crear Ranking Dif Gol -----------------------------------------------

temp_1$rank <- NA
temp_1$rank[order(-temp_1$GD)] <- 1:nrow(temp_1)
  
temp_2$rank <- NA
temp_2$rank[order(-temp_2$GD)] <- 1:nrow(temp_2)

temp_3$rank <- NA
temp_3$rank[order(-temp_3$GD)] <- 1:nrow(temp_3)

temp_4$rank <- NA
temp_4$rank[order(-temp_4$GD)] <- 1:nrow(temp_4)

temp_5$rank <- NA
temp_5$rank[order(-temp_5$GD)] <- 1:nrow(temp_5)

temp_6$rank <- NA
temp_6$rank[order(-temp_6$GD)] <- 1:nrow(temp_6)

temp_7$rank <- NA
temp_7$rank[order(-temp_7$GD)] <- 1:nrow(temp_7)

temp_8$rank <- NA
temp_8$rank[order(-temp_8$GD)] <- 1:nrow(temp_8)

temp_9$rank <- NA
temp_9$rank[order(-temp_9$GD)] <- 1:nrow(temp_9)


