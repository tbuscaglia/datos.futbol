
# 1 - Objetivo ------------------------------------------------------------

# Explorar los distintos tipos de datos disponibles de la API worldfootballR

# 2 - Setup ---------------------------------------------------------------

paquetes <- list(
  "Tidyverse"     = list("dplyr"),
  "Base de Datos" = list("worldfootballR"),
  "Web Scrapping" = list("rvest")
)

lapply(
  as.list(
    c(paquetes, recursive = TRUE, use.names = FALSE)),
  function(x) {
    library(x, character.only = TRUE, verbose = FALSE)
  })

rm(list = c("paquetes"))

# 3 - Pruebas de funciones ------------------------------------------------


partido <- "https://fbref.com/en/matches/4e263347/West-Ham-United-Newcastle-United-February-19-2022-Premier-League"


# *1 - get_advanced_match_stats -------------------------------------------

advanced_match_stats_passing <- as_tibble(get_advanced_match_stats(
  match_url      = partido, 
  stat_type      = "passing",
  team_or_player = "player"
  ) 
) %>% 
  View()

advanced_match_stats_shooting <- as_tibble(get_advanced_match_stats(
  match_url      = partido, 
  stat_type      = "possesion",
  team_or_player = "player"
) 
) %>% 
  View()

# *2 - get_match_report ---------------------------------------------------

get_match_report(match_url = partido) %>% View()

worldfootballR::get_match_shooting(match_url = partido) %>% as_tibble() %>% View()

# *3 - get_match_shooting/summary -----------------------------------------

get_match_shooting(partido) %>% View()

get_match_summary(partido) %>% View()

# 4 - Web Scrapping -------------------------------------------------------

link <- "https://fbref.com/en/matches/4e263347/West-Ham-United-Newcastle-United-February-19-2022-Premier-League"
conexion <- "#stats_7c21e445_summary .right , #stats_7c21e445_summary , #stats_7c21e445_summary .center, #stats_7c21e445_summary .left"

pagina <- read_html(link)

summary_stats <- pagina %>% 
  html_nodes(conexion) %>% 
  html_text()
   
summary_stats <- as_tibble(summary_stats)
  
