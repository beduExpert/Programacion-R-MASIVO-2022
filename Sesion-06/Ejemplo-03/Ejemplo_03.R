## EJEMPLO 03: MODELO DE REGRESIÓN LOGÍSTICA
"La regresión logística es un tipo de análisis de regresión utilizado para predecir 
el resultado de una variable categórica en función de las variables independientes 
o predictoras.

Es útil para modelar la probabilidad de un evento ocurriendo en función de otros factores."

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/telecom_service.csv")

attach(df)
y = df$churn
x = df$customer_service_calls

"Vamos a estimar la regresión logística y a interpretar los resultados:"
logistic.1 <- glm(y ~ x, 
                  data = df, family = binomial)
summary(logistic.1)

"Veamos una representación gráfica del problema para enteder su diferencia respecto 
a la regresión lineal:"
plot(churn ~ customer_service_calls, data=df, xlim = c(0,10))
curve(predict(logistic.1, newdata = data.frame(x), type = "response"),
      add = TRUE)

"A diferencia del modelo de regresión lineal, no es posible calcular el R2 de una 
regresión logística, sin embargo, se puede calcular la bondad de ajuste con base en 
la log-verosimilitud del modelo nulo y el modelo actual."
pseudo_r2.1 <- (logistic.1$null.deviance - logistic.1$deviance)/logistic.1$null.deviance
pseudo_r2.1

"Comparemos con otro modelo:"
logistic.2 <- update(logistic.1, ~.+ total_day_calls + total_day_charge)
summary(logistic.2)

pseudo_r2.2 <- (logistic.2$null.deviance - logistic.2$deviance)/logistic.2$null.deviance
pseudo_r2.2
