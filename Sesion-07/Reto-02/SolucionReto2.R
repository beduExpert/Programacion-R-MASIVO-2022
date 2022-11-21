#Reto 02: Proceso ARIMA(1,1,1) y predicción

"La función arima.sim() también nos permite simular modelos de series de tiempo con 
términos autorregresivos y de media móvil. En este ejemplo, vamos a estimar una serie de 200 obs,
con un término autorregresivo y uno de media móvil, junto con sus coeficientes asociados"
y <- arima.sim(model = list(order = c(1, 1, 1), ar = 0.8, ma = 0.3), n = 200)
plot(y)

"Con la función arima.sim() y las demás vistas en la sesión, realiza lo siguiente:"
# 1. Simula n = 1000 valores de un proceso ARIMA(1, 1, 1) con parámetros
# ar = 0.6 y ma = 0.2

# 2. Ajusta un modelo Arima a la serie simulada para estimar los
# parámetros y observa las estimaciones de los parámetros

# 3. Obtén el correlograma de los residuales del ajuste

# 4. Realiza tres predicciones con ayuda del modelo ajustado y la función predict()

# **Solución**

# A continuación, simulamos datos de un modelo ARIMA(1, 1, 1) 

set.seed(9)
x <- arima.sim(model = list(order = c(1, 1, 1), 
                            ar = 0.6, ma = 0.2), n = 1000)

# ajustamos un modelo a la serie simulada para recuperar los parámetros 
# estimados

fit <- arima(x, order = c(1, 1, 1))

# observamos las estimaciones de los parámetros

coefficients(fit)

# obtenemos el correlograma de los residuales del ajuste

acf(resid(fit), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste")

# Llevamos a cabo tres predicciones con el modelo ajustado y la función `predict`

pred <- predict(fit, n.ahead = 3)
pred$pred
