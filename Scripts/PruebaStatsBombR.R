library(StatsBombR)

competencias <- FreeCompetitions()

partidos <- FreeMatches(competencias)

StatsBombData <- StatsBombFreeEvents(MatchesDF = partidos, Parallel = TRUE)
#------------------------------
Comp <- FreeCompetitions() %>%
  filter(competition_id == 11 & season_name == "2005/2006") 

Matches <- FreeMatches(Comp) 

StatsBombData <- StatsBombFreeEvents(MatchesDF = Matches, Parallel = T) 

StatsBombData = allclean(StatsBombData) 
#-------------------------

shots_goals <- StatsBombData %>%
  group_by(team.name) %>%
  summarise(
    shots = sum(type.name == "Shot", na.rm = TRUE),
    goals = sum(shot.outcome.name == "Goal", na.rm = TRUE)
  ) 
