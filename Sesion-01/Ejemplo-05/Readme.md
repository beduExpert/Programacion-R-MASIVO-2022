# EJEMPLO 5. Instalar paquetes y cargarlos. 

# Objetivo
- Instalar paquetes
- Cargar paquetes

# Requisitos
1. Haber estudiado Prework
2. Tener previamente instalados R y RStudio

# Desarrollo

Los loops son unos de los elementos más utilizados en programación, ya que permiten ejecutar, de forma repetitiva, un serie de acciones.

Los 'for loops' son los más sencillos y utilizados en R, ya que estos iteran sobre 
los elementos de un vector, siendo su longitud el número de repeticiones:
```R
w <- c(2,4,6,8,10)

for(i in 1:length(w)) {
  w.sq <- w[i]**2
  print(w.sq)
}

w.sq <- c()
for(i in c(2,4,6,8,10)){
  w.sq <- c(w.sq, i**2)
  print(w.sq)
}
```

Por su parte, los 'while loops' ejecutan una serie mientras la condición inicial sea verdadera
```R
x <- 20
while(x>0) {
  paste("Quedan", print(x), "iteraciones")
  x <- x-1 #Siempre es importante actualizar el valor de la condición.
}
```

Otro elemento importante en programación es el uso de condicionantes, ya que estas nos permiten ejecutar acciones dependiendo de las condiciones que se 
cumplan:
```R
x <- runif(1, min=-10, max=10)

if(x > 0) {
  print("x es positivo")
} else if (x == 0) {
  print("x es igual a 0")
} else {
  print("X es negativo")
}
```
