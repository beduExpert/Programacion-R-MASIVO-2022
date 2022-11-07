## EJEMPLO 4: HISTOGRAMAS Y BOXPLOTS
"Un histograma es una gráfica de barras en donde el eje horizontal representa los 
intervalos de cases y el eje vertical representa frecuencias (absolutas o porcentuales)"
hist(var$INGRESO, breaks = bins, main = "Histograma Ingreso")

my_hist <- hist(var$INGRESO, breaks = bins, main = "Histograma", xlab = "Ingreso")
my_hist$counts <- cumsum(my_hist$counts)
plot(my_hist, main = "Histograma acumulado", xlab = "Ingreso")  

ggplot(var, aes(INGRESO)) +
  geom_histogram(bins = 4) + 
  labs(title = "Histograma", 
       x = "Ingreso",
       y = "Frequency") + 
  theme_classic()

ggplot(var, aes(INGRESO)) +
  geom_histogram(aes(y = cumsum(..count..)), bins = 4) + 
  labs(title = "Histograma acumulado", 
       x = "Ingreso",
       y = "Frequency") + 
  theme_classic()

"Los histogramas nos ayudan a conocer la distribución de la variable, la cual junto 
con su forma, nos ayuda a entender el comportamiento de los datos.

Los histogramas pueden ser simétricos. Lo que implica que su moda, media y mediana 
son aproximadamente iguales:"
d <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/distribuciones.csv")

hist(d$sim, main = "Distribución simétrica")
Mode(d$sim)[1]; median(d$sim); mean(d$sim)

hist(d$rs, main = "Distribución con sesgo a la derecha")
Mode(d$rs)[1]; median(d$rs); mean(d$rs)

hist(d$ls, main = "Distribución con sesgo a la izquierda")
Mode(d$ls)[1]; median(d$ls); mean(d$ls)

"Otra método gráfica para visulizar la distribución de una variable es a través de 
diagramas de caja y brazo, los cuales se basan en los cuartiles de la distribución 
y en su rango intercuartílico para mostrar datos extremos o atípicos."

boxplot(d$sim, horizontal = TRUE)
boxplot(d$rs, horizontal = TRUE)
boxplot(d$ls, horizontal = TRUE)
