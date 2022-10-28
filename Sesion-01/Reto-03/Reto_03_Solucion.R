## RETO 03: LOOPS Y PSEUDOCÓDIGO

"Imaginemos que tenenos una columna de datos con información del sexo de nuestros clientes:"

clientes <- c("M", "H", "NA", "M", "M", "H", "NA", "M", "H",
              "M", "M", "M", "H", "M", "H", "H", "NA", "M",
              "NA", "NA", "M", "H", "NA", "M", "M", "H", "H",
              "M", "H", "H", "H", "M", "NA", "H", "M", "M")

"Para comenzar a hacer análisis y calcular algunos estadísticos, necesitamos contar 
cuántos clientes son mujeres y hombres, así como aquellos con los que aún no 
contamos información.

Utilizando loops y pseudocódigo, desarrolla una forma rápida de lograr el objetivo
mencionado:"

m <- 0
h <- 0
na <- 0

for(i in 1:length(clientes)) {
  if (clientes[i] == "M") {
    m <- m+1
  } else if (clientes[i] == "H") {
    h <- h+1
  } else {
    na <- na+1
  }
}
