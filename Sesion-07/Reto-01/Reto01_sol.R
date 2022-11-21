# Reto 01: Modelos autorregresivos y de media móvil de primer orden

"Un modelo autorregresivo es aquel donde el comportamiento en el tiempo de una serie 
es explicado por el primer rezago de su comportamiento, es decir:
y[t]=b*y[t-1] + w[t], donde b es el coeficiente del término autorregresivo y w es 
una serie ruído blanco."

#1) Coloca el número diez como semilla
set.seed(10)

#2) Simula un proceso AR(1) de la forma x[t] = 0.8 * x[t-1] + w[t] para t = 1, 2, ..., 200 
#y muestra gráficamente la serie de tiempo obtenida

x <- w <- rnorm(200)
for(t in 2:200) x[t] <- 0.8 * x[t-1] + w[t]
plot(x, type = "l", xlab = "", ylab = "")
title(main = "Proceso AR(1) simulado",
      xlab = "Tiempo",
      ylab = expression(x[t]),
      sub = expression(x[t]==0.8*x[t-1]+w[t]))

#3) Obtén el correlograma y el correlograma parcial del proceso AR(1) simulado
acf(x, main = "")
title(main = "Correlograma del proceso AR(1) simulado", 
      sub = expression(x[t]==0.8*x[t-1]+w[t]))

pacf(x, main = "")
title(main = "Correlograma Parcial del proceso AR(1) simulado", 
      sub = expression(x[t]==0.8*x[t-1]+w[t]))

#4) Ajusta un modelo autorregresivo a la serie simulada utilizando la función ar, 
#observa el orden del modelo y los parámetros estimados. ¿Coinciden con el modelo original?
ar(x, method = "mle")
