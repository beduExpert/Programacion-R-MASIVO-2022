## EJEMPLO 04: ANÁLISIS DE VARIANZA (ANOVA)
"El análisis de varianza (de un factor) nos permite comparar la media de una variable 
considerando dos o más niveles/grupos de factor. Entre muchas otras aplicaciones 
del ANOVA, esta técnica puede emplearse como una extensión de la prueba t de Student."

"Ejemplo: ¿Existe evidencia estadística para concluir que, en promedio, el tipo de 
corte tiene efectos sobre el quilate del diamante?"

"Planteamiento de hipótesis:
Ho: prom_carat_cut_fair = prom_carat_cut_good = prom_carat_cut_very_good = prom_carat_cut_premium = prom_carat_cut_ideal
Ha: Al menos uno es diferente."
library(ggplot2)
str(diamonds)

boxplot(log(diamonds$carat))

boxplot(log(carat) ~ cut,
        data = diamonds)

anova <- aov(log(carat) ~ color,
    data = diamonds)

summary(anova)
