## RETO 02: MANIPULACIÓN DE DATAFRAMES CON DPLYR

library(dplyr)
library(ggplot2)

"Utilizando el DataFrame del Reto01 de esta sesión, crea una tabla 
que muestre sólo aquellos equipos que, en total de la liga, hayan metido 
más del 85% de los goles jugando como local. Muestra sólo las variables
HomeTeam y tu variable de proporción y arregla los datos de forma descendente 
respecto a la proporción de goles"

df %>% filter(FTR == "H") %>%
  group_by(HomeTeam) %>%
  summarize(FTHG = sum(FTHG), FTAG = sum(FTAG)) %>%
  mutate(FTTOT = FTHG + FTAG, FT_prop = FTHG / FTTOT) %>%
  arrange(desc(FT_prop)) %>%
  select(HomeTeam, FT_prop) %>%
  filter(FT_prop >= 0.85)
