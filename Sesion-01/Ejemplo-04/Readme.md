# EJEMPLO 4. Descarga y lectura de data sets.

# Objetivo
- Aprender a instalar paqueterías en el ambiente local de R
- Aprender a cargar librería en la sesión actual de trabajo

# Requisitos
1. R, RStudio
2. Prework

# Desarrollo

En R, la instalación de paqueterías sólo se realiza una ves a nivel del ambiente, por lo que no es necesario instalar nuevamente al iniciar otra sesión.
```R
install.packages("ggplot2")
install.packages("dplyr")
```

Sin embargo, instalar una paquetería no implica que ya estará disponible para su uso. En cada sesión deben llamarse las librerías a utilizar de la 
siguiente forma:
```R
library(ggplot2)
library(dplyr)
```
