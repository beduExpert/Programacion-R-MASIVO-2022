# EJEMPLO 1. Medidas de tendencia central, de posición y de dispersión

#### Objetivo:

- Conocer las funcions básicas para la lectura de bases de datos
- Manipular DataFrames

#### Requisitos

- Tener previamente instalados R y RStudio
- Haber leído y comprendido el Prework

#### Desarrollo

R tiene la capacidad de leer datos de una variedad de extensiones de forma nativa
como .txt, .csv, xlxs, .dta, .sav, entre muchos otros. También existen otras
librerías que contienen funciones para facilitar y ampliar
la capacidad de lectura.

La función más utilizada para leer archivos .txt es read.table(), la cual tiene
los siguientes argumentos:
  - file: Nombre del archivo, ruta hacia el archivo o url del archivo .txt
  - header: TRUE si la primera línea del archivo corresponde al nombre de las variables
  - sep: indica el tipo de separación. Usualmente sep='' para archivos separados por espacios
  - dec: símbolo con el que se indica la separación decimal

```R
data.1 <- read.table(file = 'https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-02/Data/ejemplo1_data.txt',
                     header = TRUE,
                     sep = '')
class(data.1)
str(data.1)
dim(data.1)
View(data.1)
```

La misma función puede utilizarse para leer archivos .csv, basta con usar sep=','.
Sin embargo, R tiene una para este tipo de archivos una función específica: read.csv()
```R
data.2 <- read.csv(file = 'https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-02/Data/RestaurantVisitors.csv',
                   header = TRUE)
class(data.2)
str(data.2)
dim(data.2)
View(data.2)
```

Un punto importante antes de comenzar a analizar nuestros datos, es asegurarnos 
que las variables tengan el formato deseado y que los valores faltantes no 
representen un problema mayor, ya que hay funciones cuyo resultado puede verse 
afectado por estos datos.

Para el primer punto, siempre podemos revisar el tipo de nuestras variables con 
la función class() que ya conocemos y usar familia de funciones as.type() 
que nos permiten recastear el tipo de variable:
```R
class(data.2$mkt_strategy)
data.2$mkt_strategy <- as.logical(data.2$mkt_strategy)
class(data.2$mkt_strategy)


class(data.2$date)
data.2$date <- as.Date.character(data.2$date, format = '%d/%m/%Y')
class(data.2$date)

class(data.1$ID)
data.1$ID <- as.character(data.1$ID)
class(data.1$ID)
```

Para revisar si en un nuesto DataFrame existen datos faltanten podemos usar 
la función complete.cases():
```R
df <- airquality
str(df)

complete.cases(df)
sum(complete.cases(df))
```

La función regresa un vector lógico con `TRUE` en las posiciones que representan 
filas donde no hay NA's y con `FALSE` aquellas filas con NA's. Este vector puede 
usarse para indexar sólo las filas completas:
```R
df.clean <- df[complete.cases(df),]
df.clean
```

Lo mismo puede lograrse con la función na.omit():
```R
na.omit(df)
```

Otra función importante para el manejo de DataFrames es la función apply(), la 
cual nos permite pasar una función específica sobre los márgenes (filas o columnas) 
de una matriz o DataFrame:
```R
datos <- data.frame(EDAD = as.integer(runif(10, min = 18, max = 26)),
                    NUM.HIJOS = as.integer(runif(10, min = 0, max = 4)),
                    INGRESO = abs(rnorm(10, mean = 5000, sd = 800)))

apply(X = datos, MARGIN = 2, mean)
```
