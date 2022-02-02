
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

path <- "~/R/Futbol.R/datos.futbol/Tablas Temporadas/CSV"

temp_1 <- read.csv2(glue::glue("{path}/12-13.csv"))
temp_2 <- read.csv2(glue::glue("{path}/13-14.csv"))
temp_3 <- read.csv2(glue::glue("{path}/14-15.csv"))
temp_4 <- read.csv2(glue::glue("{path}/15-16.csv"))
temp_5 <- read.csv2(glue::glue("{path}/16-17.csv"))
temp_6 <- read.csv2(glue::glue("{path}/17-18.csv"))
temp_7 <- read.csv2(glue::glue("{path}/18-19.csv"))
temp_8 <- read.csv2(glue::glue("{path}/19-20.csv"))
temp_9 <- read.csv2(glue::glue("{path}/20-21.csv"))


# 4 - Modificaciones a Tablas ---------------------------------------------

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

temp_1$RkGD <- NA
temp_1$RkGD[order(-temp_1$GD)] <- 1:nrow(temp_1)
  
temp_2$RkGD <- NA
temp_2$RkGD[order(-temp_2$GD)] <- 1:nrow(temp_2)

temp_3$RkGD <- NA
temp_3$RkGD[order(-temp_3$GD)] <- 1:nrow(temp_3)

temp_4$RkGD <- NA
temp_4$RkGD[order(-temp_4$GD)] <- 1:nrow(temp_4)

temp_5$RkGD <- NA
temp_5$RkGD[order(-temp_5$GD)] <- 1:nrow(temp_5)

temp_6$RkGD <- NA
temp_6$RkGD[order(-temp_6$GD)] <- 1:nrow(temp_6)

temp_7$RkGD <- NA
temp_7$RkGD[order(-temp_7$GD)] <- 1:nrow(temp_7)

temp_8$RkGD <- NA
temp_8$RkGD[order(-temp_8$GD)] <- 1:nrow(temp_8)

temp_9$RkGD <- NA
temp_9$RkGD[order(-temp_9$GD)] <- 1:nrow(temp_9)

# 6 - Diferencia Entre Temporadas -----------------------------------------

dif_1 <- temp_1$RkGD - temp_2$Rk
dif_2 <- temp_2$RkGD - temp_3$Rk
dif_3 <- temp_3$RkGD - temp_4$Rk
dif_4 <- temp_4$RkGD - temp_5$Rk
dif_5 <- temp_5$RkGD - temp_6$Rk
dif_6 <- temp_6$RkGD - temp_7$Rk
dif_7 <- temp_7$RkGD - temp_8$Rk
dif_8 <- temp_8$RkGD - temp_9$Rk


