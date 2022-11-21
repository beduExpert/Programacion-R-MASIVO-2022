# Ejemplo 3. Lectura y Manipulación de archivos JSON

#### Objetivo
- Aprender a leer y manipular un archivo JSON

#### Desarrollo

JSON es un acrónimo para JavaScript Object Notation, y fueron desarrollados e 
implementados inicialmente dentro del lenguaje de programación JS.
Los archivos JSON son un formago ligero de intercambio de datos que solucionó los 
problemas presentados por el estándar XML, sustituyéndolo y potenciando su popularidad
al punto en que el stándar JSON es aplicado y aceptado por múltiples lenguajes de programación,
APIs y diversos sistemas.

Un archivo JSON se caracteriza por almacenar valores (objetos de datos) a través de 
claves (llaves) que funcionan como identificador del valor.

Para leer y manipular archivos JSON en R necesitamos de la siguiente paquetería:
```R
install.packages("rjson")
library(rjson)
```
La función fromJSON() permite leer archivos JSON locales o en una url:
```R
URL <- "https://tools.learningcontainer.com/sample-json-file.json"
JsonData <- fromJSON(file= URL)

class(JsonData)
```
Los JSON son interpretados por R como una lista (al igual que Python), por lo que 
podemos manipularlos de la misma forma y aplicar todo lo que hemos visto en el curso:
```R
str(JsonData)

JsonData$Name
is.vector(JsonData$Pets)
JsonData$Pets[1]
```
