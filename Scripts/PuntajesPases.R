
# 1 - Objetivo ------------------------------------------------------------

# Crear un puntaje de jugadores por partido en base a estadisticas del partido

# 2 - Setup ---------------------------------------------------------------

paquetes <- list(
  "Tidyverse"     = list("dplyr", "tidyr", "tidyselect", "stringr", "ggplot2"),
  "API" = list("worldfootballR")
)

lapply(
  as.list(
    c(paquetes, recursive = TRUE, use.names = FALSE)),
  function(x) {
    library(x, character.only = TRUE, verbose = FALSE)
  })

rm(list = c("paquetes"))

# 3- Conexion a API -------------------------------------------------------

# Tottenham Hotspur vs. Everton – Monday March 7, 2022

partido <- "https://fbref.com/en/matches/6e11eac6/Tottenham-Hotspur-Everton-March-7-2022-Premier-League"

# 4 - Busco Estadisticas --------------------------------------------------

estadisticas <- get_advanced_match_stats(
  match_url      = partido,
  stat_type      = "passing",
  team_or_player = "player"
)





