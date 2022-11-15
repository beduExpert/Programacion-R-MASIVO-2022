#Reto 01: Regresión Lineal y predicción

"Una aseguradora de automóviles sueca está interesada en un modelo predictivo que 
le permite establecer el pago que sus clientes deben hacer por el seguro (Payment), explicado 
por el número de casos (Claims) y el número de asegurados (Insured).

Tu trabajo es determinar el mejor modelo de predicción"

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-06/data/SwedishMotorInsurance.csv", header = TRUE)
head(df)

"1) Selecciona solo las variables de interés y realiza una matriz de correlaciones."
df.select <- select(df, Payment, Claims, Insured)
round(cor(df.select),4)

attach(df.select)
pairs(~ Payment + Claims + Insured, 
      data = df, gap = 0.4, cex.labels = 1.5)

"2) Estima un modelo de regresión lineal de acuerdo con lo solicitado por la aseguradora. No 
olvides interpretar tus resultados y realizar el diagnóstico sobre los residuos."
m1 <- lm(Payment ~ Claims + Insured)

summary(m1)

StanRes <- rstandard(m1)

par(mfrow = c(2, 2))
plot(m1$fitted.values, Payment, ylab = "Valores ajustados")
plot(Claims, StanRes, ylab = "Residuales Estandarizados")
plot(Insured, StanRes, ylab = "Residuales Estandarizados")

qqnorm(StanRes)
qqline(StanRes)

dev.off()

shapiro.test(StanRes)

"3) Con el primero modelo, estima uno nuevo quitando la variable Insured. No 
olvides interpretar tus resultados y realizar el diagnóstico sobre los residuos."
m2 <- update(m1, ~.-Insured)
summary(m2)

StanRes2 <- rstandard(m2)

par(mfrow = c(2, 2))
plot(m2$fitted.values, Payment, ylab = "Valores ajustados")
plot(Claims, StanRes2, ylab = "Residuales Estandarizados")
plot(Insured, StanRes2, ylab = "Residuales Estandarizados")

qqnorm(StanRes2)
qqline(StanRes2)

dev.off()

shapiro.test(StanRes2)

"4) Con el primero modelo, estima uno nuevo quitando la variable Claims. No 
olvides interpretar tus resultados y realizar el diagnóstico sobre los residuos."
m3 <- update(m1, ~.-Claims)
summary(m3)

StanRes3 <- rstandard(m3)

par(mfrow = c(2, 2))
plot(m3$fitted.values, Payment, ylab = "Valores ajustados")
plot(Claims, StanRes3, ylab = "Residuales Estandarizados")
plot(Insured, StanRes3, ylab = "Residuales Estandarizados")

qqnorm(StanRes3)
qqline(StanRes3)

dev.off()

shapiro.test(StanRes2)

"5) ¿Cuál de los 3 modelos tiene un mejor poder predictivo?"
