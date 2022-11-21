# Ejemplo 4. Modelos ARIMA

#### Objetivo
- Estimar modelos autorregresivas integrados de media móvil
- Realizar predicciiones
#### Requisitos
- Haber revisado los ejemplos enteriores
- Haber hecho el prework

#### Desarrollo
ARIMA representa modelos Autorregresivos (AR) Integrados (I) de Media Móvil (MA) y se 
representan como ARIMA(q,d,p):
- q: Número de términos autorregresivos (de la variable dependiente)
- d: Número de diferencias aplicadas a la variable para hacerla estacionaria
- p: Número de rezagos en el término de error

Veamos un ejemplo de serie de tiempo para determinar al modelo ARIMA a estimar:
```R
set.seed(3)
x <- w <- rnorm(1000)
for(i in 3:1000) x[i] <- 0.5*x[i-1] + x[i-1] - 0.5*x[i-2] + w[i] + 0.3*w[i-1]

plot(x, type = "l", 
     main = "Serie simulada de un modelo ARIMA(1, 1, 1)",
     xlab = "Tiempo",
     ylab = expression(x[t]),
     sub = expression(x[t] == 0.5*x[t-1] + x[t-1] - 0.5*x[t-2] + w[t] + 0.3*w[t-1]))

acf(x)
pacf(x)
```
Como podemos ver, la serie de tiempo es no estacionaria. Calculemos la primera diferencia:
```R
acf(diff(x))
pacf(diff(x))
```
Esta transformación nos ayuda a tener una mejor idea del número de términos autorregresivos 
y de medioa móvil que incluir en el modelo. Como era de esperarse, el modelo a estimar 
debe tener I(1) y MA(1). Sin embargo, vemos que la función de AC muestra desde 1 a 3 
términos autorregresivos. Para determinar el mejor modelo, vamos a estimar los modelos 
propuestosy analizar los criterios de información de Akaike (AIC):
```R
arima(x, order = c(1, 1, 1))
arima(x, order = c(2, 1, 1))
arima(x, order = c(3, 1, 1))
```
El mejor modelo es aquel que tenga menor AIC.
Ahora pongamos esto en práctica para la producción de electricidad:
```R
plot(Elec.ts, xlab = "", ylab = "")
title(main = "Serie de Producción de Electricidad Australiana",
      ylab = "Producción de electricidad (GWh)",
      xlab = "Tiempo")

plot(diff(Elec.ts), xlab = "", ylab = "")
title(main = "Serie Diferenciada de Producción de Electricidad Australiana",
      xlab = "Tiempo", ylab = "Dif Serie",
      sub = "Gráfica de la serie diferenciada de primer Órden")

plot(diff(log(Elec.ts)), xlab = "", ylab = "")
title(main = "Serie de log dif de Producción de Electricidad Australiana",
      xlab = "Tiempo", ylab = "Dif log-Serie",
      sub = "Gráfica de la serie log-transformada diferenciada de primer órden")

fit <- arima(log(Elec.ts), order = c(0, 1, 1), seas = c(2, 0, 2))

pr <- predict(fit, 12)$pred 
ts.plot(cbind(window(Elec.ts, start = 1981), exp(pr)), col = c("blue", "red"), xlab = "")
title(main = "Predicción para la serie de producción de electricidad",
      xlab = "Mes",
      ylab = "Producción de electricidad (GWh)")
```
