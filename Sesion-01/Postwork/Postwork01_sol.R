# Leer base de datos
sp1 <- read.csv("SP1.csv")

# Crear vectores
FTHG <- sp1$FTHG
FTAG <- sp1$FTAG

# Costruir tabla de contingencia
table(FTHG,FTAG)

# ¿Cuántos goles tuvo el partido con mayor empate?
# 49 partidos con marcados (1-1)

# ¿En cuántos partidos ambos equipos empataron 0 a 0?
# 33 partidos

# ¿En cuántos partidos el equipo local (HG) tuvo la mayor goleada sin dejar que el equipo visitante (AG) metiera un solo gol?
# Un partido (6-1)
