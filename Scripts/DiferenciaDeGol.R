
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

# *1 - Dif 1 --------------------------------------------------------------


tabla.1 <- merge(temp_1, temp_2, by = "Squad")

tabla.1 <- tabla.1 %>% 
  rename(
    RkGD_1 = RkGD.x,
    Rk_1   = Rk.x,
    GD_1   = GD.x,
    RkGD_2 = RkGD.y,
    Rk_2   = Rk.y,
    GD_2   = GD.y 
  ) %>% 
  mutate(Dif = RkGD_1 - Rk_2) %>% 
  select(Squad, RkGD_1, Rk_2, Dif)

prom_temp_1 <- mean(abs(tabla.1$Dif))

# *2 - Dif 2 --------------------------------------------------------------

tabla.2 <- merge(temp_2, temp_3, by = "Squad")

tabla.2 <- tabla.2 %>% 
  rename(
    RkGD_2 = RkGD.x,
    Rk_2   = Rk.x,
    GD_2   = GD.x,
    RkGD_3 = RkGD.y,
    Rk_3   = Rk.y,
    GD_3   = GD.y 
  ) %>% 
  mutate(Dif = RkGD_2 - Rk_3) %>% 
  select(Squad, RkGD_2, Rk_3, Dif)

prom_temp_2 <- mean(abs(tabla.2$Dif))

# *3 - Dif 3 --------------------------------------------------------------

tabla.3 <- merge(temp_3, temp_4, by = "Squad")

tabla.3 <- tabla.3 %>% 
  rename(
    RkGD_3 = RkGD.x,
    Rk_3   = Rk.x,
    GD_3   = GD.x,
    RkGD_4 = RkGD.y,
    Rk_4   = Rk.y,
    GD_4   = GD.y 
  ) %>% 
  mutate(Dif = RkGD_3 - Rk_4) %>% 
  select(Squad, RkGD_3, Rk_4, Dif)

prom_temp_3 <- mean(abs(tabla.3$Dif))

# *4 - Dif 4 --------------------------------------------------------------

tabla.4 <- merge(temp_4, temp_5, by = "Squad")

tabla.4 <- tabla.4 %>% 
  rename(
    RkGD_4 = RkGD.x,
    Rk_4   = Rk.x,
    GD_4   = GD.x,
    RkGD_5 = RkGD.y,
    Rk_5   = Rk.y,
    GD_5   = GD.y 
  ) %>% 
  mutate(Dif = RkGD_4 - Rk_5) %>% 
  select(Squad, RkGD_4, Rk_5, Dif)

prom_temp_4 <- mean(abs(tabla.4$Dif))

# *5 - Dif 5 --------------------------------------------------------------

tabla.5 <- merge(temp_5, temp_6, by = "Squad")

tabla.5 <- tabla.5 %>% 
  rename(
    RkGD_5 = RkGD.x,
    Rk_5   = Rk.x,
    GD_5   = GD.x,
    RkGD_6 = RkGD.y,
    Rk_6   = Rk.y,
    GD_6   = GD.y 
  ) %>% 
  mutate(Dif = RkGD_5 - Rk_6) %>% 
  select(Squad, RkGD_5, Rk_6, Dif)

prom_temp_5 <- mean(abs(tabla.5$Dif))

# *6 - Dif 6 --------------------------------------------------------------

tabla.6 <- merge(temp_6, temp_7, by = "Squad")

tabla.6 <- tabla.6 %>% 
  rename(
    RkGD_6 = RkGD.x,
    Rk_6   = Rk.x,
    GD_6   = GD.x,
    RkGD_7 = RkGD.y,
    Rk_7   = Rk.y,
    GD_7   = GD.y 
  ) %>% 
  mutate(Dif = RkGD_6 - Rk_7) %>% 
  select(Squad, RkGD_6, Rk_7, Dif)

prom_temp_6 <- mean(abs(tabla.6$Dif))

# *7 - Dif 7 --------------------------------------------------------------

tabla.7 <- merge(temp_7, temp_8, by = "Squad")

tabla.7 <- tabla.7 %>% 
  rename(
    RkGD_7 = RkGD.x,
    Rk_7   = Rk.x,
    GD_7   = GD.x,
    RkGD_8 = RkGD.y,
    Rk_8   = Rk.y,
    GD_8   = GD.y 
  ) %>% 
  mutate(Dif = RkGD_7 - Rk_8) %>% 
  select(Squad, RkGD_7, Rk_8, Dif)

prom_temp_7 <- mean(abs(tabla.7$Dif))

# *8 - Dif 8 --------------------------------------------------------------

tabla.8 <- merge(temp_8, temp_9, by = "Squad")

tabla.8 <- tabla.8 %>% 
  rename(
    RkGD_8 = RkGD.x,
    Rk_8   = Rk.x,
    GD_8   = GD.x,
    RkGD_9 = RkGD.y,
    Rk_9   = Rk.y,
    GD_9   = GD.y 
  ) %>% 
  mutate(Dif = RkGD_8 - Rk_9) %>% 
  select(Squad, RkGD_8, Rk_9, Dif)

prom_temp_8 <- mean(abs(tabla.8$Dif))

# 7 - Crear Tabla ---------------------------------------------------------

promedio_total <- tibble(
  prom_temp_1,
  prom_temp_2,
  prom_temp_3,
  prom_temp_4,
  prom_temp_5,
  prom_temp_6,
  prom_temp_7,
  prom_temp_8
) %>%
  mutate(across(everything(), ~ round(., digits = 2))) %>%
  pivot_longer(cols = everything()) %>% 
  rename(
    temporada = name,
    promedio = value
    ) 

total_promedio <-  mean(c(
  prom_temp_1, prom_temp_2, prom_temp_3, prom_temp_4,
  prom_temp_5, prom_temp_6, prom_temp_7, prom_temp_8
  )
)
# 8 - Graficar ------------------------------------------------------------

promedio_total %>% 
ggplot() +
  geom_point(mapping = aes(temporada, promedio), size = 3) +
  geom_hline(yintercept = total_promedio, linetype = "dashed", color = "red") +
labs(title = "Diferencia Entre GD de un año y Posicion el Año Siguiente") +
  xlab("Temporadas")+
  ylab("Promedio Diferencias")




