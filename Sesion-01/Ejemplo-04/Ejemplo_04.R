## EJEMPLO 4: INSTALACIÓN Y CARGA DE PAQUETERÍAS

"En R, la instalación de paqueterías sólo se realiza una ves a nivel del ambiente,
por lo que no es necesario instalar nuevamente al iniciar otra sesión."
install.packages("ggplot2")
install.packages("dplyr")

"Sin embargo, instalar una paquetería no implica que ya estará disponible para 
su uso. En cada sesión deben llamarse las librerías a utilizar de la siguiente forma:"
library(ggplot2)
library(dplyr)
