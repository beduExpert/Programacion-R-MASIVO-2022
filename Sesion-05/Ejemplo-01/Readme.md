# Ejemplo 1. Teorema del Límite Central

#### Objetivo

- Aprender qué es el teorema del límite central, su importancia y uso en la teoría probabilística

#### Requisitos

- Tener instalado R y RStudio
- Haber estudiado el Prework

#### Desarrollo

## EJEMPLO 01: TEOREMA DEL LÍMITE CENTRAL
Todos los estadísticos son en sí mismos variables aleatorias, ya que su valor 
depende de la muestra. Para conocer la distribución muestral (de un estadístico) 
es necesario extrear muestras aleatorias repetidas de tamaño n.

Veamos un ejemplo para la media de una distribución exponencial:
```R
set.seed(2022)

par(mfrow=c(2,2))

{sample5 <- c()
n <- 5
for (i in 1:10000) {
  sample5[i] <- mean(rexp(n = n, rate = 0.1))
}
hist(sample5, main = "n = 5", xlab = "")}

{sample10 <- c()
n <- 10
for (i in 1:10000) {
  sample10[i] <- mean(rexp(n = n, rate = 0.1))
}
hist(sample10, main = "n = 10", xlab = "")}

{sample100 <- c()
n <- 100
for (i in 1:10000) {
  sample100[i] <- mean(rexp(n = n, rate = 0.1))
}
hist(sample100, main = "n = 100", xlab = "")}

{sample1000<- c()
n <- 1000
for (i in 1:10000) {
  sample1000[i] <- mean(rexp(n = n, rate = 0.1))
}
hist(sample1000, main = "n = 1000", xlab = "")}
dev.off()
```

El Teorema del Límite Central establece que, dada una muestra aleatoria suficientemente 
grande de la población, la distribución muestral de la media seguirá una distribución normal 
con un promedio igual al de la población y un error estándar igual a desv. est/sqrt(n)
```R
mean(sample1000); 1/0.1
sd(sample1000); sqrt(1/0.1**2)/sqrt(1000)
```
