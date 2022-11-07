## EJEMPLO 01: ENSAYO DE BERNOULLI Y DISTRIBUCIÓN BINOMIAL

#### Objetivo

- Entender variables aleatorias como un ensayo de Bernoulli
- Utilizar 

#### Requisitos

- Tener `R` y RStudio instalado
- Haber leído el Prework

#### Desarrollo
```R
set.seed(2022)
```

Un ensayo de Bernoulli es un experimento aleatorio en el que sólo se pueden 
obtener dos resultados: éxito o fracaso. La variable aleatoria `X` de este experimento 
tiene probabilidad `p` de resultar en éxito.

Pensemos en el caso simple de lanzar una moneda justa al aire:
```R
sample(c("Águila", "Sol"), size = 1, prob = c(0.5, 0.5))
```

Si repetimos el experimento de Bernoulli un número considerado de veces y registramos 
las veces que el experimento resultó en éxito como 1 y en fracaso como 0, podemos 
obtener gráficamente la distribución de la variable aleatoria.

Entre más grande sea el número de experimentos que realizamos, más nos acercamos 
a la distribución real de la variable aleatoria
```R
n <- 1000
p <- 0.5
count = c()
for (i in seq(n)) {
  x <- sample(c("Águila", "Sol"), size = 1, prob = c(0.5, 1-p))
  if (x == "Águila") {
    count[i] = 1
  }
  else
    count[i] = 0
  
}

barplot(table(count)/length(count), 
        main = "Experimento de Bernoulli", 
        xlab = "Resultado",
        names = c("Sol", "Águila"))
```

Para un experimento de Bernoulli tenemos que:
- `E[X] = p`
- `SD[X] = sqrt(p*(1-p))`

Esto podemos comprobarlo con las funciones descriptivas que hemos visto:
```R
mean(count)
sd(count)
```

Si nos decidimos a repetir n veces un experimento de Bernoulli y definimos la 
variable aleatoria X como el número de éxitos en n experimentos de Bernoulli, 
entonces `X~Binomial(n,p)`.

Por ejemplo: Un cliente tiene una probabilidad de 0.3 de realizar una compra en 
nuestra tienda. Si al día tenemos 10 clientes, ¿cuál es la probabilidad de que 
exactamente 0, 2, 4 y 10 de ellos realizan una compra?
```R
dbinom(x = 0, size = 10, prob = 0.3)
dbinom(x = 2, size = 10, prob = 0.3)
dbinom(x = 4, size = 10, prob = 0.3)
dbinom(x = 6, size = 10, prob = 0.3)
dbinom(x = 8, size = 10, prob = 0.3)
dbinom(x = 10, size = 10, prob = 0.3)
```

Como podemos observar, la probabilidad va incrementando y posteriormente disminuye. 
Esto nos da una idea de la cómo se comporta la distribución del número de clientes 
que realizan una compra por día. Veamos ahora la distribución real de X:
```R
binom <- rbinom(n = 10000, size = 10, prob = 0.3)

barplot(table(binom)/length(binom),
        main = "Distribución Binomial", 
        xlab = "# de clientes que realizan una compra")
```

¿Cuál es la probabilidad de que menos de 4 clientes realicen una compra? Para ello 
podríamos sumar todas las probabilidades desde x = 0 hasta x = 4, pero existe otra forma 
más fácil con la función de distribución acumulada:
```R
dbinom(x = 0, size = 10, prob = 0.3) +
  dbinom(x = 1, size = 10, prob = 0.3) +
  dbinom(x = 2, size = 10, prob = 0.3) +
  dbinom(x = 3, size = 10, prob = 0.3)

pbinom(q = 3, size = 10, prob = 0.3, lower.tail = TRUE)
```

¿Cuál es la probabilidad de que más de 5 clientes realicen una compra?
```R
dbinom(x = 6, size = 10, prob = 0.3) +
  dbinom(x = 7, size = 10, prob = 0.3) +
  dbinom(x = 8, size = 10, prob = 0.3) +
  dbinom(x = 9, size = 10, prob = 0.3) +
  dbinom(x = 10, size = 10, prob = 0.3)

pbinom(q = 5, size = 10, prob = 0.3, lower.tail = FALSE)
1 - pbinom(q = 5, size = 10, prob = 0.3, lower.tail = TRUE)
```

Para una distribución binomial tenemos que:
- `E[X] = size*p`
- `SD[X] = sqrt(size*p*(1-p))`

Esto podemos comprobarlo con las funciones descriptivas que hemos visto:
```R
mean(binom)
sd(binom)
```

Como pudiste darte cuenta en la gráfica de distribución de nuestra variable aleatoria,
esta está sesgada hacia la derecha. El sesgo de la distribución depende del parámetro `p`
```R
{par(mfrow=c(1,3))
binom.der <- rbinom(n = 10000, size = 10, prob = 0.25)
barplot(table(binom.der)/length(binom.der),
        main = "Sesgo hacia la derecha", 
        xlab = "X=x")
binom.sim <- rbinom(n = 10000, size = 10, prob = 0.5)
barplot(table(binom.sim)/length(binom.sim),
        main = "Simétrica", 
        xlab = "X=x")
binom.izq <- rbinom(n = 10000, size = 10, prob = 0.75)
barplot(table(binom.izq)/length(binom.izq),
        main = "Sesgo hacia la izquierda", 
        xlab = "X=x")}
dev.off()
```
