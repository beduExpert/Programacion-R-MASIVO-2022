library(DescTools)
library(ggplot2)
# Cargar el dataframe
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/telecom_service.csv")

# Estadísticos de tendencia central
Mode(df$total_intl_charge)[1]
mean(df$total_intl_charge)
median(df$total_intl_charge)

# Histograma
hist(df$total_intl_charge, prob=T, main="Histograma total cargos internacionales")

# Modelación
media <- mean(df$total_intl_charge)
ds <- sd(df$total_intl_charge)

curve(dnorm(x, mean = media, sd = ds), from=0, to=5, 
      col='blue', main = "Densidad de Probabilidad Normal",
      ylab = "f(x)", xlab = "X")

# ¿Cuál es la probabilidad de que el total de cargos internacionales sea menor a 1.85 usd?
pnorm(1.85, mean=media, sd=ds, lower.tail = T)

#¿Cuál es la probabilidad de que el total de cargos internacionales sea mayor a 3 usd?
pnorm(3, mean=media, sd=ds, lower.tail=F)

#¿Cuál es la probabilidad de que el total de cargos internacionales esté entre 2.35usd y 4.85 usd?
pnorm(4.85, mean=media, sd=ds) - pnorm(2.35, mean=media, sd=ds)

#Con una probabilidad de 0.48, ¿cuál es el total de cargos internacionales más alto que podría esperar?
qnorm(p=0.48, mean=media, sd=ds)

# ¿Cuáles son los valores del total de cargos internacionales que dejan exactamente al centro el 80% de probabilidad?
qnorm(p=0.10, mean=media, sd=ds)
qnorm(p=0.90, mean=media, sd=ds)
