## EJEMPLO 02: DISTRIBUCIÓN DE POISSON Y EXPONENCIAL
"Si X es una variable alestoria tal que X representa el número de eventos que ocurren 
en un periodo de tiempo fijo, entonces X~Poisson(lambda), donde lambda es el número 
promedio de eventos en un intervalo de tiempo.

Por ejemplo, un ECommerce registra, en promedio, 8 órdenes de compra cada 30 minutos. 
¿Cuál es la probabilidad de que se registren 12 órdenes de compra en los siguientes 30 minutos?"
dpois(x = 12, lambda = 8)

"Cuál es la probabilidad de que se registren entre 4 y 9 órdenes de compra en los 
siguientes 30 minutos?"
dpois(x = 9, lambda = 8) - dpois(x = 4, lambda = 8)

"Cuál es la probabilidad de que se registren menos de 5 órdenes de compra 
en los siguientes 30 minutos?"
ppois(q = 4, lambda = 8, lower.tail = TRUE)

"Para nuestro ejemplo, la distribución de la variable aleatoria tiene la siguiente 
forma:"
poisson <- rpois(n = 10000, lambda = 8)
barplot(table(poisson)/length(poisson),
        main = "Distribución de Poisson", 
        xlab = "X=x")

"Para una distribución de Possion tenemos que:
    - E[X] = lambda
    - SD[X] = sqrt(lambda)
Esto podemos comprobarlo con las funciones descriptivas que hemos visto:"
mean(poisson)
sd(poisson)

"Relacionada a la distribución de Possion, está la distribución exponencial, la 
cual modela la probabilidad del tiempo entre eventos de Poisson. Como el tiempo es 
una variable aleatoria continua, la distribución exponencial pertence a la familia 
de funciones de distribución continuas.

Esta distribución toma un sólo parámetro, el número de eventos de Possion por unidad 
de tiempo. Con nuestro ejemplo anterior, sabemos que, en promedio, se realizan 0.2667 
órdenes de compra por minuto."
rate.exp <- 8/30
rate.exp

"¿Cuál es la probabilidad de que tengan que pasar menos de 5 minutos hasta que se 
realice la siguiente orden de compra?"
pexp(q = 4, rate = rate.exp)

"Para nuestro ejemplo, la distribución de la variable aleatoria tiene la siguiente 
forma:"
curve(dexp(x, rate =rate.exp), from=0, to=15, 
      col='blue', main = "Distribución exponencial",
      ylab = "f(x)", xlab = "Tiempo entre eventos")

"Para una distribución de exponencial tenemos que:
    - E[X] = 1/lambda
    - SD[X] = sqrt(1/lambda**2)
Esto podemos comprobarlo con las funciones descriptivas que hemos visto:"
expon <- rexp(n = 1000, rate = rate.exp)
mean(expon)
sd(expon)
