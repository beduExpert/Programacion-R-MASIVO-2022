## EJEMPLO 02: DESCOMPOSICIÓN DE SERIES DE TIEMPO
"En el análisis tradicional de series de tiempo, estas se determinan con base en 
tres elementos:
- Tendencia: Dirección de los datos a largo plazo
- Estacionalidad: Comportamiento repetitivo de los datos en ciclos de tiempo específicos
- Término aleatorio

En R, podamos utilizar la función decompose() para extraer estos 3 elementos usando 
el método clásico de MA."
#- Método aditivo
Elec.decom.A <- decompose(Elec.ts, type = 'add')

plot(Elec.decom.A, xlab = "Tiempo", 
     sub = "Descomposición de los datos de producción de electricidad")

"Ahora podemos extraer cada uno de los componentes para analizarlos gráficamente"
{Tendencia <- Elec.decom.A$trend
Estacionalidad <- Elec.decom.A$seasonal
Aleatorio <- Elec.decom.A$random}

plot(Elec.ts, 
     xlab = "Tiempo", main = "Datos de Producci?n de Electricidad", 
     ylab = "Producci?n de electricidad", lwd = 2,
     sub = "Tendencia con efectos estacionales aditivos sobrepuestos")
lines(Tendencia, lwd = 2, col = "blue")
lines(Tendencia + Estacionalidad, lwd = 2, col = "red", lty = 2)

ts.plot(cbind(Tendencia, Tendencia + Estacionalidad), 
        xlab = "Tiempo", main = "Datos de Producci?n de Electricidad", 
        ylab = "Producci?n de electricidad", lty = 1:2, 
        col = c("blue", "red"), lwd = 2,
        sub = "Tendencia con efectos estacionales aditivos sobrepuestos")

"Vamos a verificar que el método de descomposición y la suma de los elementos, 
realmente genera el dato de la serie:"
Tendencia[20] + Estacionalidad[20] + Aleatorio[20]
Elec.ts[20]

#- Modelo multiplicativo
Elec.decom.M <- decompose(Elec.ts, type = "mult")

plot(Elec.decom.M, xlab = "Tiempo", 
     sub = "Descomposición de los datos de producción de electricidad")

"Ahora podemos extraer cada uno de los componentes para analizarlos gráficamente"
{Trend <- Elec.decom.M$trend
Seasonal <- Elec.decom.M$seasonal
Random <- Elec.decom.M$random}

plot(Elec.ts, 
     xlab = "Tiempo", main = "Datos de Producci?n de Electricidad", 
     ylab = "Producci?n de electricidad", lwd = 2,
     sub = "Tendencia con efectos estacionales multiplicativos sobrepuestos")
lines(Trend, lwd = 2, col = "blue")
lines(Trend * Seasonal, lwd = 2, col = "red", lty = 2)

ts.plot(cbind(Trend, Trend * Seasonal), 
        xlab = "Tiempo", main = "Datos de Producción de Electricidad", 
        ylab = "Producción de electricidad", lty = 1:2, 
        col = c("blue", "red"), lwd = 2,
        sub = "Tendencia con efectos estacionales multiplicativos sobrepuestos")

"Vamos a verificar que el método de descomposición y la suma de los elementos, 
realmente genera el dato de la serie:"
Trend[100]*Seasonal[100]*Random[100]
Elec.ts[100]
