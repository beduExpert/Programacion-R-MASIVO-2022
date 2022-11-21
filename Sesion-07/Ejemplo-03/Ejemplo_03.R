## EJEMPLO 03: CAMINATA ALEATORIA Y FUNCIONES DE AUTOCORRELACIÓN
"Para poder realizar estimaciones y predicciones de series de tiempo, los modelos 
clásicos requieren que las series de tiempo sean estacionarias, es decir, que su 
promedio (valor de tendencia de largo plazo) sea constante al igual que varianza.

Para entender cómo se comporta una serie de tiempo, vamos a analizar el modelo de 
ruido blanco ~ N(0,1)"
set.seed(3)
w <- rnorm(300)
plot(w, type = "l", xlab = "")
title(main = "Ruido Blanco Gaussiano", xlab = "Tiempo")

mean(w);sd(w)

"La función de autocorrelación es una medida de la correlación entre las observaciones 
temporales separadas por k rezagos."
acf(w)

"La función de autocorrelación parcial es una medida de la correlación entre las observaciones 
temporales separadas por k rezagos, tomando en cuenta los valores de los intervalos intermedios"
pacf(w)

"En una serie de ruído blanco, la AC y la ACP no tiene valores significativos en los 
rezagos de la variable."

"Un ejemplo de serie no estacionaria es el modelo de caminada aleatoria. En este modelo
tanto el promedio como la varianza dependen fuertemente del tiempo y sus incrementos son
ruído blanco:"
x <- w <- rnorm(1000)
for(t in 2:1000) x[t] <- x[t-1] + w[t]

plot(x, type = "l", main = "Caminata Aleatoria Simulada", 
     xlab = "t", ylab = expression(x[t]), 
     sub = expression(x[t]==x[t-1]+w[t]))

"Este es el comportamiento de la gran mayoría de las series de tiempo, lo que hace 
muy complicado utilizarlas directamente para hacer estimaciones o predicción.
Veamos como se comportan sus funciones de AC y ACP:"
acf(x)
pacf(x)

"Como se observa, la función de ACP no muestra rezagos significativos, sin embargo, 
la función de AC muestra una serie de tiempo totalmente correlacionada. Para nuestra 
suerte, muchas de las variables económicas y financieras es posible convertirlas en 
estacionarias calculando la primera diferencia; es decir, el cambio entre un periodo 
en el tiempo y otro:"

plot(diff(x), type = "l", main = "Primera diferencia de X", 
     xlab = "t", ylab = expression(x[t]), 
     sub = expression(x[t]==x[t-1]+w[t]))

acf(diff(x))
pacf(diff(x))
