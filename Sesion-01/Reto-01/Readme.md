# Reto 1. Operaciones con vectores y matrices

# Objetivo
Reforzar la creación de vectores y matrices y aprender a realizar operaciones elementales.

# Requisitos
Haber realizado el prework, además de haber realizado los ejemplos de la sesión.

# Desarrollo

Una empresa realiza un corte semanal del total de sus ventas para conocer cuál es su
utilidad neta al final de cada semana. La empresa sólo maneja dos productos (a y b),
los cuales tienen un precio de 15.5 y 7.8, así como un costo de 5.9 y 2.4 respectivamente.

Adicionalmente, en corte semanal descuenta el 10% de sus utilidades por motivo de 
impuestos.

Los datos de las unidades de ventas y devoluciones son los siguientes:
```R
ventas.a <- c(18,26,14,22,34,46,37)
ventas.b <- c(58,28,35,16,5,19,11)

devoluciones.a <- c(0,4,2,0,12,20,8)
devoluciones.b <- c(25,0,8,0,0,0,2)
```

A) Calcula las unidades de ventas netas de cada día y para cada producto:
```R
ventas.netas.a <- 
ventas.netas.b <- 
```

B) Calcula los ingresos de cada día y para cada producto:
```R
ingresos.netos.a <- 
ingresos.netos.b <- 
```

C) Calculo los costos de cada día y para cada producto:
```R
costos.netos.a <- 
costos.netos.b <- 
```

D) Con los vectores de ingreso y costos para cada producto, crea una matriz de
ingresos y otra de costos diarios
```R
ingresos.dia <- 
costos.dia <- 
```

E) Usando las matrice anteriores, calcula la utilidad bruta y neta por día
```R
utilidad.bruta.dia <- 
utilidad.neta.dia <- 
```

F) Considerando las funciones colSums() y rowSums, utiliza la adecuada para calular
la utilidad semanal por producto
```R
utilidad.neta.prod <-
```

G) Utilizando una función de R, sumo los elementos de tu resultado anterior para 
conocer la utilidad total de la semana
```R
utilidad.semanal <- 
```

