## RETO 01: LAPPLY Y LECTURA DE DATOS

library(dplyr)

"En este reto vamos a practicar nuestra habilidad en R para leer datos usando 
que ya hemos utilizado y agregando nuevas a nuestro repertorio

Supongamos que estás interesado en utilizar todos los datos disponibles de la 
liga española 2019/2020 y formar un DataFrame único de los siguientes archivos:
"

u1011 <- "https://www.football-data.co.uk/mmz4281/1011/SP1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1112/SP1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1213/SP1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/1314/SP1.csv"

"1. Crea una lista con los nombres de las variables anteriores."
lista.archivos <- list(u1011, u1112, u1213, u1314)

"2. Con ayuda de la función lapply() lee todos los .csv de lista.archivos. Usa 
help('lapply') para saber más de esta función. ¿Qué tipo de objeto regresa lapply?"
lista.csv <- lapply(lista.archivos, read.csv, header = TRUE)

"3. Ejecuta la siguiente función para sólo tomar un rango de variables. 
Más adelante en esta sesión veremos la función select"
lista.datos <- lapply(lista.csv, select, Date:FTR)

"4. Utiliza la función do.call() para repetir una función que te permite juntar 
por filas todos los elementos de lista.datos. Usa help('do.call') para saber más 
de esta función."
df <- do.call(rbind, lista.datos)
head(df)
