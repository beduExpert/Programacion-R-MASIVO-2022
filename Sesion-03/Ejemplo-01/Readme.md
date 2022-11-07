## EJEMPLO 1: TIPOS DE VARIABLES Y ESCALAS DE MEDICIÓN

#### Objetivo
- Conocer los tipos de variables estadísticas y su escala de medición
- Aprender a transformar las variables en el tipo adecuado para su manejo en R

#### Requisitos
- Tener previamente instalados R y Rstudio
- Haber estudiado el prework
- Haber realizado la lectura y comprensión del prework
- Manejo de data frames
- Analizar el código que se va mostrando y tratar de comprender la sintaxis

#### Desarrollo
```R
library(dplyr)
library(DescTools)
library(ggplot2)
library(moments)
```
A nivel estadístico, existen dos tipos de variables con distintas escalas de medición:
  - Cualitativas: Aquellas que describen una cualidad de la observación
        - Nominales: El orden de la cualidad no es importante
        - Ordinales: El orden de la cualidad sí es importante
        
  - Cuantitativas: Aquellas que rdescriben una cantidad relacionada con la observación.
      estas pueden ser de intervalo o razón.
        - Discretas: Resultan de un proceso de conteo
        - Continuas: Resultan de un proceso de medición

Es importante identificar correctamente el tipo de variable y su escala de medición, 
ya que con base en ello aplicaremos cierto tipo de técnicas y herramientas estadísticas.

Veamos la estadística descriptiva de las siguientes variables. ¿Tiene sentido?
```R
var <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/variables.csv")
str(var)
summary(var)
```

Vamos a transformar las variables a su tipo y escala correspondiente
```R
var$SEXO <- factor(var$SEXO)
var$ESTUDIOS <- factor(var$ESTUDIOS, levels = c("Primaria", "Bachillerato", "Licenciatura", "Maestria"), ordered = TRUE)
var$NIVEL_SOCIOECO <- factor(var$NIVEL_SOCIOECO, levels = c("Bajo", "Medio", "Alto"), ordered = TRUE)
var$MEDIO_CONTACTO <- factor(var$MEDIO_CONTACTO)
var$ACTIVO <- factor(var$ACTIVO, labels = c("No", "Si"))

summary(var)
```
