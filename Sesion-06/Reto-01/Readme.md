 
## Reto 1. Swedish Motor Insurance

### OBJETIVO 

- Estimar y comparar modelos de regresión lineal

#### REQUISITOS 

- Tener R y Rstudio instalado
- Haber cubierto los temas en el prework
- Realizar los ejemplos

#### DESARROLLO

#Reto 01: Regresión Lineal y predicción

Una aseguradora de automóviles sueca está interesada en un modelo predictivo que 
le permite establecer el pago que sus clientes deben hacer por el seguro (Payment), explicado 
por el número de casos (Claims) y el número de asegurados (Insured).

Tu trabajo es determinar el mejor modelo de predicción

```R
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-06/data/SwedishMotorInsurance.csv", header = TRUE)
head(df)
```  

1) Selecciona solo las variables de interés y realiza una matriz de correlaciones.

2) Estima un modelo de regresión lineal de acuerdo con lo solicitado por la aseguradora. No 
olvides interpretar tus resultados y realizar el diagnóstico sobre los residuos.

3) Con el primero modelo, estima uno nuevo quitando la variable `Insured`. No 
olvides interpretar tus resultados y realizar el diagnóstico sobre los residuos.

4) Con el primero modelo, estima uno nuevo quitando la variable `Claims`. No 
olvides interpretar tus resultados y realizar el diagnóstico sobre los residuos.

5) ¿Cuál de los 3 modelos tiene un mejor poder predictivo?
