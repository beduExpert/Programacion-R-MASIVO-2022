# EJEMPLO 02: SUPUESTOS DEL MODELO DE REGRESIÓN LINEAL Y PREDICCIÓN

#### Objetivo

- Estudiar los supuestos clásicos del modelo de regresión lineal
- Realizar predicciones y calcular sus intervalos de confianza

#### Requisitos

- Tener instalado R y RStudio
- Haber estudiado el prework

#### Desarrollo

El modelo de regresión lineal clásico establece ciertos supuestos en el término 
de error:
1) Eltérmino de error no tiene correlación significativa con las variables 
explicativas. En caso contrario, tendríamos un problema de endogeneidad.
2) El término de error sigue una distribución normal

```R
StanRes2 <- rstandard(m2)

par(mfrow = c(2, 2))

plot(Food, StanRes2, ylab = "Residuales Estandarizados")
plot(Decor, StanRes2, ylab = "Residuales Estandarizados")
plot(East, StanRes2, ylab = "Residuales Estandarizados")

qqnorm(StanRes2)
qqline(StanRes2)

dev.off()

shapiro.test(StanRes2)
```
La prueba de Shapiro-Wilk tiene los siguientes juegos de hipótesis:
- Ho: La variable distribuye como una normal
- Ha: La variable no distribuye como una normal

Una vez validados estos supuestos, podemos realizar utilizar nuestro modelo estimado 
para realizar predicciones y obtener su intervalo de confianza
```R
data <- data.frame(
  Food = c(18.6, 30.3, 22.1, 24.9),
  Decor = c(20, 15, 10, 9),
  East = c("Yes", "No", "Yes", "No")
)

predict(m2, newdata = data, interval = "confidence", level = 0.95)
```

Para comprender mejor manera el papel de los intervalos en la predicción, vamos a 
estimar un modelo de regresión simple para realizar una representación gráfica"
```R
modelo <- lm(Price ~ Food)

Food.values <- data.frame(Food = sort(c(18.6, 22.1, 24.9, 30.3), decreasing = FALSE))
pred <- predict(modelo, newdata = Food.values, interval = "confidence", level = 0.95)

plot(Food, Price, xlab = "Food", 
     ylab = "Price", pch = 16)
points(Food.values$Food, pred[,1], xlab = "Food", 
     ylab = "Price", pch = 16, col = "red")
abline(lsfit(Food, Price))

plot(Food.values$Food, pred[,1], xlab = "Food", 
       ylab = "Price", pch = 16, col = "red")
abline(lsfit(Food.values$Food, pred[,1]))

lines(Food.values$Food, pred[, 2], lty = 2, lwd = 2, col = "blue")
lines(Food.values$Food, pred[, 3], lty = 2, lwd = 2, col = "blue")
```
