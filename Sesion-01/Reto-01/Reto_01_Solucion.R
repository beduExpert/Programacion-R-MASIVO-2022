## RETO 01: OPERACIONES CON VECTORES Y MATRICES
"Una empresa realiza un corte semanal del total de sus ventas para conocer cuál es su
utilidad neta al final de cada semana. La empresa sólo maneja dos productos (a y b),
los cuales tienen un precio de 15.5 y 7.8, así como un costo de 5.9 y 2.4 respectivamente.

Adicionalmente, en corte semanal descuenta el 10% de sus utilidades por motivo de 
impuestos.

Los datos de las unidades de ventas y devoluciones son los siguientes:"
ventas.a <- c(18,26,14,22,34,46,37)
ventas.b <- c(58,28,35,16,5,19,11)

devoluciones.a <- c(0,4,2,0,12,20,8)
devoluciones.b <- c(25,0,8,0,0,0,2)

"A) Calcula las unidades de ventas netas de cada día y para cada producto:"
ventas.netas.a <- ventas.a - devoluciones.a
ventas.netas.b <- ventas.b - devoluciones.b

"B) Calcula los ingresos de cada día y para cada producto:"
ingresos.netos.a <- 15.5*ventas.a
ingresos.netos.b <- 7.8*ventas.b

"C) Calculo los costos de cada día y para cada producto"
costos.netos.a <- 5.9*ventas.a
costos.netos.b <- 2.4*ventas.b

"D) Con los vectores de ingreso y costos para cada producto, crea una matriz de
ingresos y otra de costos diarios"
ingresos.dia <- cbind(ingresos.netos.a, ingresos.netos.b)
costos.dia <- cbind(costos.netos.a, costos.netos.b)

"E) Usando las matrice anteriores, calcula la utilidad bruta y neta por día"
utilidad.bruta.dia <- ingresos.dia - costos.dia
utilidad.neta.dia <- (1-0.1)*utilidad.bruta.dia

"F) Considerando las funciones colSums() y rowSums, utiliza la adecuada para calular
la utilidad semanal por producto"
utilidad.neta.prod <- colSums(utilidad.neta.dia)

"G) Utilizando una función de R, sumo los elementos de tu resultado anterior para 
conocer la utilidad total de la semana"
utilidad.semanal <- sum(utilidad.neta.prod)
