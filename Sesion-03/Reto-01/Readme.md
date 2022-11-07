## RETO 01: TABLAS DE DISTRIBUCIÓN DE FRECUENCIAS

#### Objetivo
- Utilizar tablas de distribución de frecuencias para analizar variables  

#### Requisitos
- Tener previamente instalados R y Rstudio
- Manipulación de datos
- Gráficas y atributos

#### Desarrollo
```R
library(ggplot2)
```

Para este reto vamos a hacer uso del dataframe `diamonds`, disponible en la librería 
de `ggplot2`. Realiza los siguientes incisos y responde a las preguntas:

1) ¿Qué tipo de variable y escala de medición tiene la variable cut?


2) Reliza una tabla de frecuencias absolutas y relativas


3) Para esta variable, ¿es posible calcular la frecuencia relativa acumulada? En 
caso afirmativo, agrégala a tu tabla anterior


4) Con base en tu tabla, responde:
    - ¿Cuál es el porcentaje de diamantes que tienen un corte Very Good?
    - ¿Cuál es el porcentaje de diamantes que tienen un corte entre Fair y Very Good?
    - ¿Cuál es el porcentaje de diamantas que tienen un corte al menos Very Good?

5) Crea una tabla de distribución de frecuencias para el precio de los diamantes. Para ello 
determina el número de clases con base en la regla de Sturges `k = 1+3.3Log10(n)`


6) Con base en tu tabla, responde:
    - ¿Cuál es el porcentaje de diamantes que tienen un precio entre 3590.17 y 4678.23?
    - ¿Cuál es el porcentaje de diamantes que tienen un precio menor a 7942.41?
    - ¿Cuál es el porcentaje de diamantes que tienen un precio mayor a 11206.58?
