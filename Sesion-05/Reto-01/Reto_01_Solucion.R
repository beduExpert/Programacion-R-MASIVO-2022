# Reto01: Teorema del Límite Central
"La distribución Beta es una función de distribución continua definida en el intervalo [0,1],
por lo que sus mayores aplicaciones están en la modelación de variables aleatoria que 
representan proporciones o porcentajes.

Esta función de distribución tiene dos parámetros alpha (a) y beta (b), los cuales definen 
la forma de la distribución. El promedio y la varianza se calculan como:
E(X) = a/(a+b)
Var(x) = (ab)/((a+b+1)*(a+b)**2)"

"1.- Grafica la densidad de la distribución Beta con parámetros a=5,b=1"
a <- 5
b <- 1

curve(dbeta(x, shape1 = a, shape2 = b), 
      from = 0, to = 1, 
      xlab = "X", ylab = "f(x)", main = "Distribución Beta")

"2.- Mediante muestro repetitivo, muestra gráficamente que la distribución del promedio 
de la distribución beta se aproxima a una distribución normal."
par(mfrow=c(2,2))

{sample5 <- c()
  n <- 5
  for (i in 1:10000) {
    sample5[i] <- mean(rbeta(n = n, shape1 = a, shape2 = b))
  }
  hist(sample5, main = "n = 5", xlab = "")}

{sample10 <- c()
  n <- 10
  for (i in 1:10000) {
    sample10[i] <- mean(rbeta(n = n, shape1 = a, shape2 = b))
  }
  hist(sample10, main = "n = 10", xlab = "")}

{sample100 <- c()
  n <- 100
  for (i in 1:10000) {
    sample100[i] <- mean(rbeta(n = n, shape1 = a, shape2 = b))
  }
  hist(sample100, main = "n = 100", xlab = "")}

{sample1000<- c()
  n <- 1000
  for (i in 1:10000) {
    sample1000[i] <- mean(rbeta(n = n, shape1 = a, shape2 = b))
  }
  hist(sample1000, main = "n = 1000", xlab = "")}
dev.off()

"3.- Muestra que el promedio y la desviación estándar del muestreo se aproxima al
promedio y error estándar teóricos de la distribución de la media"
mean(sample1000); a/(a+b)
sd(sample1000); sqrt((a*b)/((a+b+1)*(a+b)**2))/sqrt(1000)
