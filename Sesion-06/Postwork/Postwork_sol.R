"Supongamos que nuestro trabajo consiste en aconsejar a un cliente sobre 
como mejorar las ventas de un producto particular, y el conjunto de datos 
con el que disponemos son datos de publicidad que consisten en las ventas 
de aquel producto en 200 diferentes mercados, junto con presupuestos de 
publicidad para el producto en cada uno de aquellos mercados para tres 
medios de comunicación diferentes: TV, radio, y periódico. No es posible 
para nuestro cliente incrementar directamente las ventas del producto. Por 
otro lado, ellos pueden controlar el gasto en publicidad para cada uno de 
los tres medios de comunicación. Por lo tanto, si determinamos que hay una 
asociación entre publicidad y ventas, entonces podemos instruir a nuestro 
cliente para que ajuste los presupuestos de publicidad, y así 
indirectamente incrementar las ventas. 

En otras palabras, nuestro objetivo 
es desarrollar un modelo preciso que pueda ser usado para predecir las 
ventas sobre la base de los tres presupuestos de medios de comunicación. Ajuste 
modelos de regresión lineal múltiple a los datos advertisement.csv y elija el 
modelo más adecuado siguiendo los procedimientos vistos"

"Considera:*

Y: Sales (Ventas de un producto)
X1: TV (Presupuesto de publicidad en TV para el producto)
X2: Radio (Presupuesto de publicidad en Radio para el producto)
X3: Newspaper (Presupuesto de publicidad en Periódico para el producto)"

adv <- read.csv("advertising.csv")

attach(adv)

# A continuación mostramos una matriz de gráficos de dispersión de los
# tres predictores continuos y la variable de respuesta. 

pairs(~ Sales + TV + Radio + Newspaper, data = adv, gap = 0.4, cex.labels = 1.5)

# Observamos relaciones aproximadamente lineales

# Llevamos a cabo el ajuste de un modelo
# Sales = beta0 + beta1*TV + beta2*Radio + beta3*Newspaper + e

m1 <- lm(Sales ~ TV + Radio + Newspaper)

# Obtenemos un resumen

summary(m1)

# Ajustamos nuevamente un modelo pero ahora sin considerar la variable Newspaper
# ya que en el resultado anterior se observó que su coeficiente de regresión
# no fue estadísticamente significativo (al considerar su p-value)

# Y = beta0 + beta1*TV + beta2*Radio + e (Reducido)

m2 <- update(m1, ~.-Newspaper)
summary(m2)

# Diagnósticos


# A continuación veremos gráficas de residuales estandarizados contra cada
# predictor. 

StanRes2 <- rstandard(m2)
par(mfrow = c(2, 2))
plot(TV, StanRes2, ylab = "Residuales Estandarizados")
plot(Radio, StanRes2, ylab = "Residuales Estandarizados")

qqnorm(StanRes2)
qqline(StanRes2)

dev.off()

shapiro.test(StanRes2)

# Consideraremos el siguiente modelo con interacción

# Sales = beta0 + beta1*TV + beta2*Radio +  beta3*TV*Radio + e

mfull <- lm(Sales ~ TV + Radio + 
                         TV:Radio)

summary(mfull)

# Ahora compararemos el modelo mfull contra el modelo m2. 
# Es decir, llevaremos a cabo una prueba de hipótesis
# general de

# H0: beta3 = 0
# es decir Sales = beta0 + beta1*TV + beta2*Radio + e
# contra
# H1: H0 no es verdad
# es decir, 
# Sales = beta0 + beta1*TV + beta2*Radio +  beta3*TV*Radio +  e

# Esta puede lograrse usando la siguiente prueba-F parcial.

anova(m2,mfull)

# Dado que el p-value es aproximadamente 7.633e-07, rechazamos la hipótesis nula
# y nos decidimos por la hipótesis alternativa
# Sales = beta0 + beta1*TV + beta2*Radio +  beta3*TV*Radio +  e

# Diagnósticos
StanRes <- rstandard(mfull)
par(mfrow = c(2, 2))
plot(TV, StanRes, ylab = "Residuales Estandarizados")
plot(Radio, StanRes, ylab = "Residuales Estandarizados")

# Buscamos evidencia para soportar la hipótesis de normalidad en los errores 

qqnorm(StanRes)
qqline(StanRes)

dev.off()

shapiro.test(StanRes)
