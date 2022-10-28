# RETO 02: LECTURA DE DATAFRAMES

# Objetivo

- Conocer cómo leer Dataframes

# Requisitos

Haber cumplido con los retos anteriores. Documentarse con el prework 

# Desarrollo

En la gran mayoría de las sesiones estaremos utilizando distintas tablas de datos,
por lo que es importante a prender a leerlas.

Como recordarás, el formato .csv es uno de los más utilizados, por lo que nos 
enfocaremos en ello, sin embargo, la mayoría de funciones para leer archivos 
siguen la misma lógica.

La función read.csv() toma un argumento principal, que establece la ruta de sistema 
o url al archivo .csv.

Si vas a leer un archivo que se encuentra localmente en tu computadora, es importante
que este se encuentre en la dirección actual de trabajo, la cual puedes consultar 
con la función getwd(). Para cambiar la dirección de trabajo puedes usar la función 
setwd(path)

A) Usando la función de lectura adecuada, lee el archivo que se encuentra en la 
siguiente url
```R
netflix <- 
```

B) Verifica la clase de la tabla, el número de variables y de observaciones, así 
como el nombre de las variables
```R

```

C) Usando indexación, selecciona sólo los datos de películas que fueron estrenadas 
desde 2015 y hasta antes del 2019
```R
net.2015 <- 
```

D) Por último, averigua que hace la siguiente función
```R
View(net.2015)
```
