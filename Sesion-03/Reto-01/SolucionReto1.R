
## RETO 01: TABLAS DE DISTRIBUCIÓN DE FRECUENCIAS
library(ggplot2)

"Para este reto vamos a hacer uso del dataframe diamonds, disponible en la librería 
de ggplot2. Realiza los siguientes incisos y responde a las preguntas:"

"1) ¿Qué tipo de variable y escala de medición tiene la variable cut?"
"R. Cualitativa ordinal"

"2) Reliza una tabla de frecuencias absolutas y relativas"
freq <- table(diamonds$cut)
transform(freq, 
          rel.freq=prop.table(Freq))

"3) Para esta variable, ¿es posible calcular la frecuencia relativa acumulada? En 
caso afirmativo, agrégala a tu tabla anterior"
freq <- table(diamonds$cut)
transform(freq, 
          rel.freq=prop.table(Freq),
          cum.freq=cumsum(prop.table(Freq)))

"4) Con base en tu tabla, responde:
    - ¿Cuál es el porcentaje de diamantes que tienen un corte Very Good? 22.39%
    - ¿Cuál es el porcentaje de diamantes que tienen un corte entre Fair y Very Good? 34.48%
    - ¿Cuál es el porcentaje de diamantas que tienen un corte al menos Very Good? 87.92%"

"5) Crea una tabla de distribución de frecuencias para el precio de los diamantes. Para ello 
determina el número de clases con base en la regla de Sturges (1+3.3Log10(n))"
k = ceiling(1 + 3.3*log10(length(diamonds$price)))
ac = (max(diamonds$price)-min(diamonds$price))/k

bins <- seq(min(diamonds$price), max(diamonds$price), by = ac)

price.diamonds <- cut(diamonds$price, breaks = bins, include.lowest=TRUE, dig.lab = 10)

dist.freq <- table(price.diamonds)
transform(dist.freq, 
          rel.freq=prop.table(Freq), 
          cum.freq=cumsum(prop.table(Freq)))

"6) Con base en tu tabla, responde:
    - ¿Cuál es el porcentaje de diamantes que tienen un precio entre 3590.17 y 4678.23? 9.31%
    - ¿Cuál es el porcentaje de diamantes que tienen un precio menor a 7942.41 85.74%
    - ¿Cuál es el porcentaje de diamantes que tienen un precio mayor a 11206.58? 7.54%"
