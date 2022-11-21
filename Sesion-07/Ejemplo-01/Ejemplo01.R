######################## SESIÓN 7: SERIES DE TIEMPO  ##########################
###############################################################################

## EJEMPLO 01: MANIPULACIÓN DE SERIES DE TIEMPO
"Una serie de tiempo representa una secuencia de datos ordenados de forma cronológica
y secuencial, por lo que para su análisis es necesario que todas las observaciones 
estén registradas con un índice en tiempo discreto y que las observaciones estén en
intervalos de tiempo equidistantes.

Veamos cómo analizar y manipular series de tiempo en R. Para ello vamos a comenzar 
analizando el siguiente dataframe:"
url = "https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-06/Ejemplo-01/cbe.csv"
CBE <- read.csv(url, header = TRUE)
head(CBE)
class(CBE)

"La función ts() nos permite crear un objeto de serie de tiempo a partir de un vector.
Basta con establecer los siguientes argumentos
- start: Periodo inicial de la serie
- end: Periodo inicial de la seria
- freq: Número de observaciones por unidad de tiempo

Vamos a crear 3 series de tiempo mensuales para los datos que tenemos:"
Elec.ts <- ts(CBE[, 3], start = c(1958,1), freq = 12)
Beer.ts <- ts(CBE[, 2], start = c(1958,1), freq = 12)
Choc.ts <- ts(CBE[, 1], start = c(1958,1), freq = 12)
class(Elec.ts);class(Beer.ts);class(Choc.ts)

plot(cbind(Elec.ts, Beer.ts, Choc.ts), 
     main = "Producci?n de Chocolate, Cerveza y Electricidad", 
     xlab = "Tiempo",
     sub = "Enero de 1958 - Diciembre de 1990")
