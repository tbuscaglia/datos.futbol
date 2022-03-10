
# 1 - Objetivo ------------------------------------------------------------

# Crear un puntaje de jugadores por partido en base a estadisticas del partido

# 2 - Setup ---------------------------------------------------------------

paquetes <- list(
  "Tidyverse"     = list("dplyr", "tidyr"),
  "Base de Datos" = list("worldfootballR")
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
    Mss_Total            = Cmp_Total - Att_Total,
    # Cmp_percent_Quantile = quantile(Cmp_percent_Total, seq(0, 1, nrow(pases))),
    across(c(CmpPerMin, AttPerMin), ~ round(., digits = 3))
  )

cortes <- c(0, 0.2, 0.4, 0.6, 0.8, 1)

percentil <- quantile(pases$Cmp_percent_Total, cortes) %>%
  tibble(
    valor = percentil,
    porcentaje = scales::percent(cortes)
  ) 

# 5 - Crear Puntaje -------------------------------------------------------

pases <- pases %>% 
  mutate(
    Pts_Inicial     = 6,
    Pts_Min         = Min * 0.01,
    Pts_Cmp_Total   = Cmp_Total * 0.05,
    Pts_Err_Total   = Mss_Total * 0.05,
    Pts_Cmp_percent = if (Cmp_percent_Total == tabla_percentil[1]) {-1}
    ,
    Pts_Total = Pts_Inicial + Pts_min + Pts_Cmp_Total + Pts_Err_Total + Pts_Cmp_percent,
    Pts_Total = ifelse(Pts_Total > 10, 10, Pts_Total)
  ) %>% 
  select(starts_with("Pts"))

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

