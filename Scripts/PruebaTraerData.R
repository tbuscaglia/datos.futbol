
# 1 - Objetivo ------------------------------------------------------------

# Explorar los distintos tipos de datos disponibles de la API worldfootballR

# 2 - Setup ---------------------------------------------------------------

paquetes <- list(
  "Tidyverse"     = list("dplyr", "tidyr"),
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

# 3 - Funciones worldfootballR --------------------------------------------

partido <- "https://fbref.com/en/matches/4e263347/West-Ham-United-Newcastle-United-February-19-2022-Premier-League"

# *1 - get_advanced_match_stats -------------------------------------------

passing <- get_advanced_match_stats(
  match_url      = partido, 
  stat_type      = "passing",
  team_or_player = "player"
) %>%
  filter(Team == "West Ham United") %>% 
  select(-c(
    starts_with(c("Home", "Away")),
    League, Gender, Country, Season, 
    Match_Date, Matchweek, Game_URL,
    Player_Num, Nation, Age, Team, Pos
    )
  )

possession <- get_advanced_match_stats(
  match_url      = partido, 
  stat_type      = "possession",
  team_or_player = "player"
) %>% 
  filter(Team == "West Ham United") %>% 
  select(-c(
    starts_with(c("Home", "Away")),
    League, Gender, Country, Season, 
    Match_Date, Matchweek, Game_URL,
    Player_Num, Nation, Age, Team, Pos
    )
  )

defense <- get_advanced_match_stats(
  match_url      = partido, 
  stat_type      = "defense",
  team_or_player = "player"
)%>% 
  filter(Team == "West Ham United") %>% 
  select(-c(
    starts_with(c("Home", "Away")),
    League, Gender, Country, Season, 
    Match_Date, Matchweek, Game_URL,
    Player_Num, Nation, Age, Team, Pos
    )
  )

stats <- left_join(
   passing,
   possession,
   by = "Player"
 ) %>% 
   left_join(
     .,
     defense,
     by = "Player"
   ) 
  

# stats <- transpose(stats)
# 
# rownames(stats) <- colnames(stats)
# colnames(stats) <- stats$Player


