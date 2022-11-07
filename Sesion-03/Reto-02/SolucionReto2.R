## RETO 02: MEDIDAS DESCRIPTIVAS
library(ggplot2)

"Para este reto vamos a hacer uso del dataframe diamonds, disponible en la librería 
de ggplot2. Realiza los siguientes incisos y responde a las preguntas:"

"1) Calcula e interpreta las medidas de tendencia central de la variable price"
library(DescTools)
Mode(diamonds$price); median(diamonds$price); mean(diamonds$price)

"2) Con base en tu resultado anteior, ¿qué se puede concluir respecto al sesgo del precio?"
"R. Dado que moda < mediana < media, la distribución está sesgada a la derecha."

"3) Calcula e interpreta la desviación estándar y los cuartiles de la distribución:"
sd(diamonds$price) # El precio tiene una dispersión promedio, respecto a la media, de 3989.44

quantile(diamonds$price, probs = c(0.25, 0.50, 0.75))
# 25% de los diamantes tienen un precio de 950 o menos
# 50% de los diamantes tienen un precio de 2401 o menos
# 75% de los diamantes tienen un precio de 5324.25 o menos

"4) Realiza un histograma de la variable precio. ¿Su distribución coincide con tu 
conclusión de la pregunta 2?"
hist(diamonds$price)

"5) Realiza un boxplot de la variable precio. ¿Su forma se relaciona con la distribución 
mostrada por el histograma anteior? ¿Existen datos atípicos?"
boxplot(diamonds$price)
