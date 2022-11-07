## RETO 03: DISTRIBUCIÓN NORMAL
"1.- El tiempo necesario para producir un determinado producto en una maquinaria tiene 
una distribución normal cuya media es 80 minutos con desviación estándar de 10 minutos."
set.seed(0202)

"a) Grafica la función de distribución de la variable aleatoria."
curve(dnorm(x, mean = 80, sd = 10), from=40, to=120, 
      col='blue', main = "Densidad de Probabilidad Normal",
      ylab = "f(x)", xlab = "X")

"b) ¿Cuál es la probabilidad de que la maquinaria termine el producto en una hora o menos?"
pnorm(q = 60, mean = 80, sd = 10)

"c) ¿Cuál es la probabilidad de que el producto sea terminado en más de 1.5 horas, pero en menos de 2.5 horas?"
pnorm(q = 150, mean = 80, sd = 10) - pnorm(q = 90, mean = 80, sd = 10)

"d) ¿Cuál es el intervalo de tiempo que deja exactamente al centro el 90% de probabilidad"
qnorm(p = 0.1/2, mean = 80, sd = 10); qnorm(p = 0.1/2, mean = 80, sd = 10, lower.tail = FALSE)


"2.- Una institución de crédito informa a las autoridades que, en promedio, sus 
clientes mantienen un saldo deudor en sus tarjetas de crédito igual a 12,500 pesos 
mensuales, con una desviación estándar de 7,800 pesos."

"a) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor mayor a $20,000?"
pnorm(q = 20000, mean = 12500, sd = 7800, lower.tail = FALSE)

"b) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor menor a $11,000?"
pnorm(q = 11000, mean = 12500, sd = 7800)

"c) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor entre $13,000 y 15,000?"
pnorm(q = 15000, mean = 12500, sd = 7800) - pnorm(q = 13000, mean = 12500, sd = 7800)

"d) ¿Hasta qué monto se encuentra el 10% de clientes con saldo deudor más bajo?"
qnorm(p = 0.10, mean = 12500, sd = 7800)
