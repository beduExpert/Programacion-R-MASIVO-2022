# EJEMPLO 01: MODELO DE REGRESIÓN LINEAL

#### Objetivo

- Entender el concepto de ´regresión lineal y sus aplicaciones
- Estimar e interpretar modelos de regresión lineal 

#### Requisitos 
- Tener instalado R y RStudio
- Haber estudiado el Prework

####  Desarrollo
La regresión lineal es una técnica de modelado estadístico que se emplea para 
describir una variable de respuesta continua como una función de una o varias 
variables predictoras. Puede ayudar a comprender y predecir el comportamiento de 
distintos fenómenos aleatorios

Este modelo describe la relación entre una variable dependiente como una función 
de una o varias variables independientes. El método más utlizado para su estimación 
es el de Mínimos Cuadrados Ordinarios, el cual consiste en minizar la suma de los 
residuos al cuadrado, siendo el residuo la diferencia que hay entre el valor observado 
y el valor pronosticado por una propuesta de modelo.

Estos modelos lineales tienen, como toda línea recta, una intersección y una pendiente 
asociada a cada variables explicativa.

Ahora vamos cómo hacer la estimación de un modelo y hagamos la interpretación de los 
resultados obtenidos:
```R
library(dplyr)
library(ggplot2)

df <- read.csv("nyc_restaurants.csv", header = TRUE)
str(df)

df$East <- factor(df$East, labels = c("No", "Yes"))

df.select <- select(df, Price, Food, Decor, Service)
round(cor(df.select),4)  

pairs(~ Price + Food + Decor + Service + East, 
      data = df, gap = 0.4, cex.labels = 1.5)
```

Estimación por Mínimos Cuadrados Ordinarios (OLS)
'Y = beta0 + beta1*Food + beta2*Decor + beta3*Service + beta4*East + e'
```R
attach(df)
m1 <- lm(Price ~ Food + Decor + Service + East)

summary(m1)
```

De los resultados anteriores, podemos concluir que el coeficiente de la variable 
Service no es significativo. Probemos nuestro modelo sin incluir dicha variable:
'Y = beta0 + beta1*Food + beta2*Decor + beta4*East + e'
```R
m2 <- update(m1, ~.-Service)
summary(m2)
```

##### TÉRMINOS DE INTERACCIÓN
La variable East es una variable dicotómica que identifica si el restaurante está 
en el este de la 5ta Avenida o no. Con este tipo de variables, podemos evaluar 
efectos cruzados, es decir, podemos generar un efecto diferenciados en cada una de 
las variables continuas dependiendo de si miden a un restaurante que está o no en 
el este de la 5ta Avenida.

Con esto en mente, podemos considerar el siguiente modelo con efectos cruzados:
'Y = beta0 + beta1*Food + beta2*Decor +  beta3*Service + beta4*East 
      + beta5*Food*East + beta6*Decor*East + beta7*Service*East + e (Completo)'
      
El cual estiamos de la siguiente forma:
```E
mfull <- lm(Price ~ Food + Decor + Service + East + 
              Food:East + Decor:East + Service:East)

summary(mfull)
```

De forma individual, los coeficientes de los términos de interacción no son significativos.
Sin embargo, también debemos evaluar la significancia global del modelo, esto es, 
podemos comparar un modelo tomando en cuenta todos los efectos cruzados y compararlo 
contra otro modelo sin efectis cruzados.

Para ello, planteamos el siguiente juego de hipótesis:
- H0: beta3 = beta5 = beta6 = beta7 = 0
'(Y = beta0 + beta1*Food + beta2*Decor + beta4*East + e)'

- H1: H0 no es verdad (AL MENOS UN COEFICIENTE ES DISTINTO DE 0)
'(Y = beta0 + beta1*Food + beta2*Decor +  beta3*Service + beta4*East 
         + beta5*Food*East + beta6*Decor*East + beta7*Service*East + e)'

Para este tipo de inferencia usamos el enfoque de análisis de varianza (ANOVA), 
ya que estamos comparando la variabilidad de un modelo no restringido contra la 
variabilidad de un modelo restringido.
```R
anova(m2,mfull)
```

Con base en el p-value del estadístico de prueba, no podemos rechazar Ho, por lo 
existe al menos un coeficiente de los terminos de interacción que es distinto de 0 y,
por lo tanto, contribuyen en la explicación del precio:
'Y = beta0 + beta1*Food + beta2*Decor + beta4*East + e (Reducido)'
