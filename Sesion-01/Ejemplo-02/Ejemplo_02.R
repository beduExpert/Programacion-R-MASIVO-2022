## EJEMPLO 2: VECTORES Y MATRICES

"Los vectores y matrices son otro tipo de objetos en R, quizá los más importantes
debido a su relación con las tablas de datos y varios métodos estadísticos.

Los vectores en R representan una colección de uno o más objetos del mismo tiempo,
los cuales definen el tipo de vector y su longitud.

Veamos cómo crear un vector con la función 'c()':"

a <- c(4, 6, 8, 10,12)
length(a)
class(a)
is.vector(a)

b <- c("A", "B", "C", "D")
length(b)
class(b)
is.vector(b)

c <- c(TRUE, FALSE, FALSE, TRUE)
length(c)
class(c)
is.vector(c)

"Un punto importante de los vectores es que se puede acceder a sus elementos 
através de la indexación:"
a[1]

b[4]

c[5]

"Los vectores también pueden crearse a partir de secuencias, repeticiones e
incluso otros vectores"

d = c(a,b)
class(c)
is.vector(c)

(e <- seq(from=0, to=10, by=22)) #Observa qué hacen los paréntesis

(f <- seq(from=10, to=0, by=-2))

(g <- rep(5, times=6))

"Por su parte, las matrices se conforman por una colección de vectores y están 
definidas por filas y columnas, por lo que son objetos en dos dimensiones de forma
rectangular.

Al igual que los vectores, las matrices sólo pueden contener objetos del mismo tipo
en sus celdas; usualmente numéricos o booleanos.

La forma más sencilla de crear matrices es a partir se sequencias:"

m <- matrix(1:9, nrow=3, ncol=3)
dim(m)
class(m)

"Las matrices también pueden crearse a partir de la combinación de vectores, ya 
sea por filas o por columnas"

vector.1 <- c(1,2,3,4,5)
vector.2 <- c(6,7,8,9,10)
vector.3 <- c(11,12,13,14,15)

(m.2 <- rbind(vector.1, vector.2, vector.3)) #rbind() permite combinar objetos por filas
dim(m.2) # La dimensión siempre se interpreta como (filas, columnas)

(m.3 <- cbind(vector.1, vector.2, vector.3)) #cbind() permite combinar objetos por filas
dim(m.3)

t(m.2) # Matriz transpuesta

"Para acceder a los elementos de una matriz, se puede usar la misma lógica que en los 
vectores, pero indicando posición en las filas y en las columnas"

m[1,1]

m[,1] # Esto implica tomar el primer vector, y por definición, todos los vectores son columnas en R

m.2[1:2,2:3]

m.3[c(1:2,5), 2:3]

"En arreglos como vectores y matrices se pueden evaluar operaciones lógicas, las 
cuales pueden ser utilizadas para extraer subconjuntos o para"
m>4
m[m>4] 

m.3 > 8 & m.3 < 13
m.3[m.3 > 8 & m.3 < 13]

"Algunas operaciones básicas de matrices
Producto matricial: A %*% B
Producto elemento a elemento: A*B
Determinante: det(A)
Extraer la diagonal: diag(A)
Resolver un sistema de ecuaciones lineales (( Ax=b )): solve(A,b)
Inversa: solve(A)
Autovalores y autovectores: eigen(A)"
