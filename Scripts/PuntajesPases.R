
# 1 - Objetivo ------------------------------------------------------------

# Crear un puntaje de jugadores por partido en base a estadisticas del partido

# 2 - Setup ---------------------------------------------------------------

paquetes <- list(
  "Tidyverse"     = list("dplyr", "tidyr", "tidyselect", "stringr"),
  "Base de Datos" = list("worldfootballR"),
  "Graficar"      = list("ggplot2")
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

pases <- get_advanced_match_stats(
  match_url      = partido,
  stat_type      = "passing",
  team_or_player = "player"
) %>% 
  select(Team, Player, Pos, Min, Cmp_Total, Att_Total, Cmp_percent_Total) %>% 
  mutate(
    CmpPerMin            = Cmp_Total / Min,
    AttPerMin            = Att_Total / Min,
    Mss_percent_Total    = 100 - Cmp_percent_Total,
    Mss_Total            = Att_Total - Cmp_Total,
    Pos_Rel              = case_when(
      Pos == "GK" ~ 1,
      str_detect(Pos, "CB") ~ 2,
      str_detect(Pos, "LB") ~ 3,
      str_detect(Pos, "RB") ~ 4,
      str_detect(Pos, "WB") ~ 5,
      str_detect(Pos, "DM") ~ 6,
      str_detect(Pos, "AM") ~ 7,
      str_detect(Pos, "LW") ~ 8,
      str_detect(Pos, "RW") ~ 9,
      str_detect(Pos, "FW") ~ 10
    ),
    Pos_Rel = as.factor(Pos_Rel),
    across(c(CmpPerMin, AttPerMin), ~ round(., digits = 3))
  )

posiciones <- pases %>% 
  select(Player, Pos, Pos_Rel)

# Cmp_percent_Quantile = quantile(Cmp_percent_Total, seq(0, 1, nrow(pases))),

# cortes <- c(0, 0.2, 0.4, 0.6, 0.8, 1)

# percentil <- quantile(pases$Cmp_percent_Total, cortes) %>%
#   tibble(
#     valor = percentil,
#     porcentaje = scales::percent(cortes)
#   ) 

# 5 - Crear Puntaje -------------------------------------------------------

puntos <- pases %>% 
  mutate(
    Pts_Inicial     = 6,
    Pts_Min         = Min * 0.01,
    Pts_Cmp_Percent = case_when(
      Cmp_percent_Total < 50 ~ 0.1,
      between(Cmp_percent_Total, 50, 55) ~ 0.2,
      between(Cmp_percent_Total, 55, 60) ~ 0.3,
      between(Cmp_percent_Total, 60, 65) ~ 0.4,
      between(Cmp_percent_Total, 65, 70) ~ 0.5,
      between(Cmp_percent_Total, 70, 75) ~ 0.6,
      between(Cmp_percent_Total, 75, 80) ~ 0.7,
      between(Cmp_percent_Total, 80, 85) ~ 0.8,
      between(Cmp_percent_Total, 85, 90) ~ 0.9,
      between(Cmp_percent_Total, 90, 95) ~ 1,
      between(Cmp_percent_Total, 95, 100) ~ 1.5
    ),
    Pts_Err_Percent = case_when(
      Mss_percent_Total < 5 ~ -0.1,
      between(Mss_percent_Total, 5, 10) ~ -0.2,
      between(Mss_percent_Total, 10, 15) ~ -0.3,
      between(Mss_percent_Total, 15, 20) ~ -0.4,
      between(Mss_percent_Total, 20, 25) ~ -0.5,
      between(Mss_percent_Total, 25, 30) ~ -0.6,
      between(Mss_percent_Total, 30, 35) ~ -0.7,
      between(Mss_percent_Total, 35, 40) ~ -0.8,
      between(Mss_percent_Total, 40, 45) ~ -0.9,
      between(Mss_percent_Total, 45, 50) ~ -1,
      Mss_percent_Total > 50 ~ -1.5
    ),
    Pts_CmpPerMin = case_when(
      CmpPerMin < 0.1 ~ -0.4,
      between(CmpPerMin, 0.1, 0.2) ~ -0.3,
      between(CmpPerMin, 0.2, 0.3) ~ -0.2, 
      between(CmpPerMin, 0.3, 0.4) ~ -0.1, 
      between(CmpPerMin, 0.4, 0.5) ~ 0, 
      between(CmpPerMin, 0.5, 0.6) ~ 0.1, 
      between(CmpPerMin, 0.6, 0.7) ~ 0.2, 
      between(CmpPerMin, 0.7, 0.8) ~ 0.3, 
      between(CmpPerMin, 0.8, 0.9) ~ 0.4, 
      between(CmpPerMin, 0.9, 1) ~ 0.5
    ),
    # Pts_Err_Total   = Mss_Total * 0.1,
    Pts_Total = Pts_Inicial + Pts_Min + Pts_Cmp_Percent + Pts_Err_Percent,
    Pts_Total = ifelse(Pts_Total > 10, 10, Pts_Total)
  )
# %>%
  # select(Player, Team, Pos, Min, starts_with("Pts"))

# Cmp_percent_Total > 50 & Cmp_percent_Total <= 55 ~ 0.2,
# Cmp_percent_Total > 55 & Cmp_percent_Total <= 60 ~ 0.3,
# Cmp_percent_Total > 60 & Cmp_percent_Total <= 65 ~ 0.4,
# Cmp_percent_Total > 65 & Cmp_percent_Total <= 70 ~ 0.5,
# Cmp_percent_Total > 70 & Cmp_percent_Total <= 75 ~ 0.6,
# Cmp_percent_Total > 75 & Cmp_percent_Total <= 80 ~ 0.7,
# Cmp_percent_Total > 80 & Cmp_percent_Total <= 85 ~ 0.8,
# Cmp_percent_Total > 85 & Cmp_percent_Total <= 90 ~ 0.9,
# Cmp_percent_Total > 90 & Cmp_percent_Total <= 95 ~ 1.0,
# Cmp_percent_Total > 95 ~ 1.5,

puntos %>% 
  ggplot(mapping = aes(x = Player, y = Pts_Total, color = Pos_Rel, fill = Pos_Rel)) +
  geom_col() +
  coord_flip()

puntos %>% 
  ggplot(mapping = aes(x = Pos_Rel, y = Pts_Total)) +
  geom_boxplot()

# Pts_Cmp_percent = if (Cmp_percent_Total == tabla_percentil[1]) {-1}

# Pts_Cmp_percent = if (Cmp_percent_Quantile < 25) {
#   -2
# } else if (between(Cmp_percent_Quantile, 20, 50)) {
#   -1
# } else if (between(Cmp_percent_Quantile, 50, 60)) {
#   1
# } else if (between(Cmp_percent_Quantile, 60, 70)) {
#   1.5
# } else if (between(Cmp_percent_Quantile, 70, 80)) {
#   2
# } else if (between(Cmp_percent_Quantile, 80, 90)) {
#   2.5
# } else if (between(Cmp_percent_Quantile, 90, 100)) {
#   3
# }

