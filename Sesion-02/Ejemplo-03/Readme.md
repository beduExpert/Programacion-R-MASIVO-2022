# EJEMPLO 3. VISUALIZACIÓN DE DATOS CON GGPLOT

#### Objetivo

- Conocer la importancia de la visualización de datos
- Aprender el álgebra de geometrías presentada por la librería ggplot2

#### Requisitos

- Tener conocimientos básicos para manipular data frames

#### Desarrollo

library(ggplot2)
names(mtcars)
head(mtcars)

`ggplot` es otra librería bastante popular de `tidyverse`, y al mismo tiempo una de 
las más utilizadas en R para realizar visualizaciones de datos.

La lógica de ggplot es realizar álgebra de gráficas, ya que cada elemento de la 
gráfica se va sumando de forma secuencial hasta obtener la gráfica final.

Una gráfica en ggplot debe contener al menos 3 elementos:
  - Datos: El Data set que se va a graficar
  - Estéticos: La escala sobre la cual vamos a mapear los datos
  - Geometrías: La forma en que se visualizarán los datos

1) Gráficas de puntos
```R
ggplot(mtcars, aes(x=cyl, y = hp)) + 
  geom_point()
```

La variable `cyl`, aunque numérica, sólo acepta 4, 6 y 8 como valores, por lo que 
podemos transformarla a factor para mejorar la visualización:
```R
ggplot(mtcars, aes(x=factor(cyl), y = hp)) + 
  geom_point()
```

Ahora graficaremos más variables agregando elementos de color, tamaño y forma
```R
ggplot(mtcars, aes(x=factor(cyl), y = hp, color = mpg)) + 
  geom_point()

ggplot(mtcars, aes(x=factor(cyl), y = hp, color = mpg, size = wt)) + 
  geom_point()

ggplot(mtcars, aes(x=factor(cyl), y = hp, color = mpg, size = wt, shape=factor(vs))) + 
  geom_point()
```

Las gráficas de ggplot representan objetos que pueden asignarse a variables para 
poco a poco ir sumando más elementos

Veamos como la siguiente gráfica termina en algo mucho más presentable e informativo
```R
ggplot(mtcars, aes(x = mpg, y=hp, color = am, size = wt)) + 
  geom_point() 

g <- ggplot(mtcars, aes(x = mpg, y=hp, color = factor(am), size = wt)) + 
        geom_point(shape=1, alpha=0.6) 
g

g <- g + scale_y_continuous(limits = c(50, 350),
                            breaks = seq(50,350, 75)) +
         scale_x_continuous(breaks = seq(10, 35, 5))
g


g <- g + scale_color_discrete("Transmission", labels = c("Automatic", "Manual")) +
         scale_size("Weight", labels = c(">=2,000 lbs", ">=3,000 lbs", ">=4,000 lbs", ">=5,000 lbs"))
g

g <- g + labs(title = "Motor Card Road",
              x = "Miles per Gallon",
              y = "Horsepower") + 
         theme_classic()
g

ggsave("motorcardroad.jpg", plot = g)
```

2) Gráficas de barras
```R
names(diamonds)
head(diamonds)

ggplot(diamonds, aes(cut)) + 
  geom_bar(fill = "darkblue", alpha = 0.5) +
  scale_y_continuous(limits = c(0, 22500),
                     breaks = seq(0,22500, 2500)) + 
  labs(title = "Cut Diamonds", 
       x = "Cut type",
       y = "Frequency") + 
  theme_classic()
```

3) Gráficas de línea
```R
fish <- read.csv("fish.csv")
fish <- mutate(fish, Capture = Capture/100000)

ggplot(fish, aes(x = Year, y = Capture)) + 
  geom_line()

ggplot(fish, aes(x = Year, y = Capture, linetype = Species)) + 
  geom_line() + theme_minimal()
```
