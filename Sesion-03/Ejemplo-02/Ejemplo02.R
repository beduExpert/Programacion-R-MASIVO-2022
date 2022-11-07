## EJEMPLO 2: TABLAS DE DISTRIBUCIÓN DE FRECUENCIAS
"El objetivo principal de la estadística descriptiva, es presentar, de forma sintetizada, 
la información para su correcto análisis.

Vamos a comenzar con métodos tabulares para presentar un resumen de la información:"
freq <- table(var$ESTUDIOS)
transform(freq, 
          rel.freq=prop.table(Freq))

ggplot(var, aes(x = ESTUDIOS)) +
  geom_bar()

"Hacer este mismo análisis para variables cuantitativas puede resultar en una tabla 
de frecuencias muy larga y poco informativa (¿por qué?). En su lugar, debemos realizar
clases o intervalos con rangos específicos.

Vamos a comenzar por calcular el número de clases y el ancho de la clase"
k = ceiling(sqrt(length(var$INGRESO)))
ac = (max(var$INGRESO)-min(var$INGRESO))/k

"Ahora vamos a crear una secuencia que vaya del valor mínimo al máximo con el ancho 
de clase. Esto nos va a permitir hacer cortes con las clases correspondientes:"
bins <- seq(min(var$INGRESO), max(var$INGRESO), by = ac)

ingreso.clases <- cut(var$INGRESO, breaks = bins, include.lowest=TRUE, dig.lab = 8)

"Con esto, podemos crear nuestra tabla de distribución de frecuencias:"
dist.freq <- table(ingreso.clases)
transform(dist.freq, 
          rel.freq=prop.table(Freq), 
          cum.freq=cumsum(prop.table(Freq)))
