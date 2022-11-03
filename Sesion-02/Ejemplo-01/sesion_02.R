############## SESIÓN 2: MANIPULACIÓN Y VISUALIZACIÓN DE DATOS  ###############
###############################################################################
## EJEMPLO 1: LECTURA Y MANIPULACIÓN DE DATAFRAMES

"R tiene la capacidad de leer datos de una variedad de extensiones de forma nativa
como .txt, .csv, xlxs, .dta, .sav, entre muchos otros. También existen otras
librerías que contienen funciones para facilitar y ampliar
la capacidad de lectura.

La función más utilizada para leer archivos .txt es read.table(), la cual tiene
los siguientes argumentos:
  - file: Nombre del archivo, ruta hacia el archivo o url del archivo .txt
  - header: TRUE si la primera línea del archivo corresponde al nombre de las variables
  - sep: indica el tipo de separación. Usualmente sep='' para archivos separados por espacios
  - dec: símbolo con el que se indica la separación decimal"

data.1 <- read.table(file = 'https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-02/Data/ejemplo1_data.txt',
                     header = TRUE,
                     sep = '')
class(data.1)
str(data.1)
dim(data.1)
View(data.1)

"La misma función puede utilizarse para leer archivos .csv, basta con usar sep=','.
Sin embargo, R tiene una para este tipo de archivos una función específica: read.csv()"
data.2 <- read.csv(file = 'https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-02/Data/RestaurantVisitors.csv',
                   header = TRUE)
class(data.2)
str(data.2)
dim(data.2)
View(data.2)

"Un punto importante antes de comenzar a analizar nuestros datos, es asegurarnos 
que las variables tengan el formato deseado y que los valores faltantes no 
representen un problema mayor, ya que hay funciones cuyo resultado puede verse 
afectado por estos datos.

Para el primer punto, siempre podemos revisar el tipo de nuestras variables con 
la función class() que ya conocemos y usar familia de funciones as.type() 
que nos permiten recastear el tipo de variable::"

class(data.2$mkt_strategy)
data.2$mkt_strategy <- as.logical(data.2$mkt_strategy)
class(data.2$mkt_strategy)

class(data.2$date)
data.2$date <- as.Date.character(data.2$date, format = '%d/%m/%Y')
class(data.2$date)

class(data.1$ID)
data.1$ID <- as.character(data.1$ID)
class(data.1$ID)

"Para revisar si en un nuesto DataFrame existen datos faltanten podemos usar 
la función complete.cases():"

df <- airquality
str(df)

complete.cases(df)
sum(complete.cases(df))

"La función regresa un vector lógico con `TRUE` en las posiciones que representan 
filas donde no hay NA's y con `FALSE` aquellas filas con NA's. Este vector puede 
usarse para indexar sólo las filas completas:"

df.clean <- df[complete.cases(df),]
df.clean

"Lo mismo puede lograrse con la función na.omit():"
na.omit(df)

"Otra función importante para el manejo de DataFrames es la función apply(), la 
cual nos permite pasar una función específica sobre los márgenes (filas o columnas) 
de una matriz o DataFrame:"

datos <- data.frame(EDAD = as.integer(runif(10, min = 18, max = 26)),
                    NUM.HIJOS = as.integer(runif(10, min = 0, max = 4)),
                    INGRESO = abs(rnorm(10, mean = 5000, sd = 800)))

apply(X = datos, MARGIN = 2, mean)

## EJEMPLO 2: MANIPULACIÓN DE DATAFRAMES CON DPLYR

library(dplyr)
visitas.rest <- read.csv(file = 'https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-02/Data/RestaurantVisitors.csv',
                                header = TRUE)
"dplyr es una de las librarías más utilizadas en R y forma parte de la familia 
de librerías de tidyverse.

La librería dplyr contiene diversas funciones para la manipulación y transformación 
de DataFrames, las cuales son muy intuitivas de aplicar ya que librería utiliza 
verbos para la ejecución de acciones"

"'select()' nos permite seleccionar una serie de variables de un DataFrame"

visitas.rest.select <- select(visitas.rest, date, spending, total)
class(visitas.rest.select)
names(visitas.rest.select)

"El primer argumento de la función select() es un dataframe, al igual que en 
el resto de funciones de dplyr. Como en muchas ocaciones vamos a encadenar 
varias funciones de dplyr a un dataframe, es útil utilizar el operador de 
pipeline 'dataframe %>% fun', el cual pasa el objeto que contiene un dataframe 
como argumento de la función:"

visitas.rest %>% select(date, spending, total)

"'arrange() ordena las filas de un dataframe de acuerdo con los valores 
de una o más variables:"

visitas.rest.orden <- visitas.rest %>%
                              select(date, spending, total) %>%
                              arrange(spending, desc(total))
head(visitas.rest.orden)

"'filter()' facilita la forma en la que indexamos o extreamos filas 
con base en condiciones lógicas:"

visitas.rest.filtro <- visitas.rest %>%
                              select(date, spending, total) %>%
                              arrange(spending, desc(total)) %>%
                              filter(spending > 1000000, spending < 1200000)
head(visitas.rest.filtro)


"'mutate()' permite transformar variables o crear nuevas a partir de otras"

visitas.rest.per.visita <- visitas.rest %>%
                                  select(date, spending, total) %>%
                                  mutate(spending_per_visit = spending / total) %>%
                                  arrange(desc(spending_per_visit))
head(visitas.rest.per.visita)


"'group_by()' y 'summarize()' son dos verbos que usualmente son usados en conjunto. 
El primero permite agrupar los datos con base en un factor (variable cualitativa), 
mientras que el segundo permite resumir la información a través de funciones
"
visitas.rest.group.summ <- visitas.rest %>%
                       select(date, holiday, spending) %>%
                       mutate(holiday = factor(holiday, labels = c("No", "Yes"))) %>%
                       group_by(holiday) %>%
                       summarize(total_spending = sum(spending),
                                 mean_spending = mean(spending),
                                 sd_spending = sd(spending))
head(visitas.rest.group.summ)

## EJEMPLO 3: VISUALIZACIÓN DE DATOS CON GGPLOT
library(ggplot2)
names(mtcars)
head(mtcars)

"Ggplot es otra librería bastante popular de Tidyverse, y al mismo tiempo una de 
las más utilizadas en R para realizar visualizaciones de datos.

La lógica de ggplot es realizar álgebra de gráficas, ya que cada elemento de la 
gráfica se va sumando de forma secuencial hasta obtener la gráfica final.

Una gráfica en ggplot debe contener al menos 3 elementos:
  - Datos: El Data set que se va a graficar
  - Estéticos: La escala sobre la cual vamos a mapear los datos
  - Geometrías: La forma en que se visualizarán los datos"

"1) Gráficas de puntos"

ggplot(mtcars, aes(x=cyl, y = hp)) + 
  geom_point()

"La variable cyl, aunque numérica, sólo acepta 4, 6 y 8 como valores, por lo que 
podemos transformarla a factor para mejorar la visualización:"

ggplot(mtcars, aes(x=factor(cyl), y = hp)) + 
  geom_point()

"Ahora graficaremos más variables agregando elementos de color, tamaño y forma"
ggplot(mtcars, aes(x=factor(cyl), y = hp, color = mpg)) + 
  geom_point()

ggplot(mtcars, aes(x=factor(cyl), y = hp, color = mpg, size = wt)) + 
  geom_point()

ggplot(mtcars, aes(x=factor(cyl), y = hp, color = mpg, size = wt, shape=factor(vs))) + 
  geom_point()

"Las gráficas de ggplot representan objetos que pueden asignarse a variables para 
poco a poco ir sumando más elementos

Veamos como la siguiente gráfica termina en algo mucho más presentable e informativo"

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

"2) Gráficas de barras"
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

"3) Gráficas de línea"
fish <- read.csv("fish.csv")
fish <- mutate(fish, Capture = Capture/100000)

ggplot(fish, aes(x = Year, y = Capture)) + 
  geom_line()

ggplot(fish, aes(x = Year, y = Capture, linetype = Species)) + 
  geom_line() + theme_minimal()
