# Ejemplo 2. Inferencia a la media de la población

#### Objetivo

- Aprender a inferir los valores de la media de una o dos poblaciones

#### Requisitos

- Tener instalados R y RStudio
- Haber trabajado con el Prework

#### Desarrollo:

#### Inferencia a una población

###### Muestra grande (n >= 30) o desv. estándar poblacional conocida
Cuando la muestra es grande o conocemos la desv. estandar de la población, el estadístico 
de prueba que utilizaremos para tomar una decisión sobre la hipótesis nula tendrá 
una distribución normal estándar, con la cual se calcularán los valores p del 
estadístico de prueba.

###### Muestra pequeña (n < 30) y desv. estándar poblacional conocida
Cuando la muestra es pequeña y no conocemos la desviación estándar de la población, 
podemos utilizar un estimador, conocido como desviación estándar de la muestra. 
Esto hace que el estadístico de prueba cambie su distribución a una t de Student.

Esta distribución tiene características similares a la distribución normal estándar, 
salvo que tiene un único parámetro (grados de libertad) y es utilizada 
preferentemente en lugar de la distribución Z, ya que a medida que el tamaño de 
la muestra es más grande, su densidad se acerca a la de la distribución normal estándar
```R
{curve(dnorm(x), from = -4, to = 4, xlab = "X", ylab = "f(x)", main = "Distribución t - Student")
legend(x = 2, y = 0.4, legend=c("N(0,1)", "df=1", "df=5", "df=10", "df=100"),
       col=c("black","blue", "green", "orange", "red"), lty = 1, bty = "n", cex=0.8)}
curve(dt(x, 1), from = -4, to = 4, col = "blue", add = TRUE)
curve(dt(x, 5), from = -4, to = 4, col = "green", add = TRUE)
curve(dt(x, 10), from = -4, to = 4, col = "orange", add = TRUE)
curve(dt(x, 100), from = -4, to = 4, col = "red", add = TRUE)
```

Ejemplo: Un estudio anterior de telecomunicaciones señala que, en promedio, el 
total de llamadas internacionales es menor a 4.54. ¿A qué NC EEE para concluir 
que lo mismo sucede en nuestro mercado?
```R
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/telecom_service.csv")
```

Planteamiento de hipótesis:
Ho: prom_total_intl_calls >= 4.54
Ha: prom_total_intl_calls < 4.54
```R
t.test(x=df$total_intl_calls, alternative = 'less', mu=4.54)
```

Ejemplo: El mismo estudio, señala que, en promedio, el número de mensajes de voz 
es mayor a 7.79 A un NC del 95%, ¿EEE para concluir que lo mismo sucede en nuestro mercado?

Planteamiento de hipótesis:
Ho: prom_total_num_vmail_messages <= 7.79
Ha: prom_total_num_vmail_messages > 7.79
```R
t.test(x=df$number_vmail_messages, alternative = 'greater', mu=7.79)
```

Ejemplo: El mismo estudio, señala que, en promedio, el número de llamadas de servicio 
es mayor a 7.79 A un NC del 95%, ¿EEE para concluir que lo mismo sucede en nuestro mercado?

Planteamiento de hipótesis:
Ho: prom_customer_service_calls == 1.59
Ha: prom_customer_service_calls =! 1.59
```R
t.test(x=df$customer_service_calls, alternative = 'two.sided', mu=1.59)
```
#### Inferencia a dos poblaciones

## EJEMPLO 02.b: INFERENCIA A LA MEDIA DE DOS POBLACIONES
En inferencia estadística también podemos hacer comparaciones entre la media de 
una variable para diferentes grupos.

En el caso de comparación de dos medias, el estadístico a utilizarse puede distribuir 
como una normal estándar o una t - Student, dependiende si se cumplen las condiciones 
antes mencionadas. Para el caso particular de la distribución t - Student, es necesario 
verificar si las desviaciones estándar de cada grupo son iguales o diferentes en 
la población, por lo que realizaremos una prueba estadística para verificar esto:

Ejemplo: El mismo estudio, señala que, el promedio de llamadas de atención a clientes
en los usuarios que cancelaron el servicio es mayor que los que no cancelaron
A un NC del 90%, ¿EEE para concluir que lo mismo sucede en nuestro mercado?

Planteamiento de hipótesis:
Ho: prom_customer_service_calls_churn1 <= prom_customer_service_calls_churn2 
Ha: prom_customer_service_calls_churn1 > prom_customer_service_calls_churn2
```R
var.test(df[df$churn == 1, "customer_service_calls"], 
         df[df$churn == 0, "customer_service_calls"], 
         ratio = 1, alternative = "two.sided")

t.test(x = df[df$churn == 1, "customer_service_calls"], y = df[df$churn == 0, "customer_service_calls"],
       alternative = "greater",
       mu = 0, var.equal = FALSE)
```

Ejemplo: Prueba que, en promedio, el número de llamadas internacionales realizadas 
por los usuarios que cancelaron es igual a las realizadas por quienes no cancelaron

Planteamiento de hipótesis:
Ho: prom_total_intl_calls_churn1 == prom_total_intl_calls_churn2 
Ha: prom_total_intl_calls_churn1 =! prom_total_intl_calls_churn2
```R
var.test(df[df$churn == 1, "total_intl_calls"], 
         df[df$churn == 0, "total_intl_calls"], 
         ratio = 1, alternative = "two.sided")

t.test(x = df[df$churn == 1, "customer_service_calls"], 
       y = df[df$churn == 0, "customer_service_calls"],
       alternative = "two.sided",
       mu = 0, var.equal = TRUE)
```
