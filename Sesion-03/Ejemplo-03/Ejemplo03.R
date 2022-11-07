## EJEMPLO 3: MEDIDAS DESCRIPTIVAS
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/telecom_service.csv")
summary(df)

# Medidas de tendencia central
mean(df$total_day_calls)
mean(df$total_day_calls, trim = 0.20)

median(df$total_day_calls)

Mode(df$total_day_calls)

# Medidas de dispersión
var(df$total_day_calls)
sd(df$total_day_calls)

IQR(df$total_day_calls) #Dispersión alrededor a la mediana
iqr = quantile(df$total_day_calls, probs = 0.75) - quantile(df$total_day_calls, probs = 0.25)
iqr

# Medidas de posición (CuaNtiles)
# CuaRtiles (Separan la distribución de los datos en 4 partes de 25% cada una)
# q1, q2 y q3
# Deciles (Separan la distribución de los datos en 10 partes de 10% cada una)
# d1, d2, d3, d4, d5, d6, d7, d8, d9
# Percentiles o centiles (Separan la distribución de los datos en 100 partes de 1% cada una) 
# p1, p2, p3, ... p10, ... p20, ..., p25, ... , p50, p75, ... p99

# Equivalencias
# d1 = p10 (En general dk = p(k*10) para toda k = 1, ... 9)
# q1 =  p25
# q2 = d5 = p50 (= mediana)
# q3 = p75

cuartiles <- quantile(df$total_day_calls, probs = c(0.25, 0.50, 0.75))
cuartiles

deciles <-quantile(df$total_day_calls, probs = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9))
deciles

percentiles <- quantile(df$total_day_calls, probs = seq(0.01,0.99, by=0.01))
percentiles

# Medidas de forma
"Sesgo: Nos permite ver si los datos se encuentran de forma simétrica alrededor de la media 
Curtosis: Nos permite tener una idea de qué tan concentrados se encuentran los datos alrededor 
de la media"
d <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/distribuciones.csv")

skewness(d$rs) #s > 0 Sesgo a la derecha
skewness(d$sim) #s = 0 Simétrica
skewness(d$ls) #s < 0 Sesgo a la izquierda

kurtosis(d$rs) #Leptocúrtica k > 3
kurtosis(d$sim) #Mesocúrtica k = 3
                #Platocúrtica k < 3
