
#- 1 - Librerias---------------------------------

library(tidyverse)
library(readxl)

#- 2 - Importar datos----------------------------

data <- read_excel(
  path             = "C:/Users/tomas/Documents/R/Futbol.R/Data Excel/1. SquadShooting.xlsx",
  col_names        = FALSE,
  )
  

#- 3 -Limpiar Datos------------------------------



#- 4 - Visualizar Datos--------------------------

data %>%
  ggplot()+
  geom_point(mapping = aes(,  ))
