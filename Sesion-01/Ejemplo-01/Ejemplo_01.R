## EJEMPLO 1: TIPOS DE DATOS

"R es un lenguaje de programación orientada a objetos (OOP), por lo que todos los
elementos con los que opera son en realidad objetos, que son asignados a variables
para su almacenamiento local.

Dentro del lenguaje de R, existen una gran cantidad de objetos que deben conocerse
a detalle para saber cómo pueden operar cada uno de ellos.

En esta primera sesión comenzaremos a ver los objetos más importantes, sin embargo,
a lo largo de todo el módulo veremos una gran cantidad de ellos.

Veamos cómo asignar un objeto a una variable:"

var.1 <- "Hola Mundo"
var.2 <- 5L
var.3 <- 5
var.4 <- 2.7076
var.5 <- TRUE

"Cada uno de estos objetos pertenece a una clase particular, la cual puede entenderse
como una huella digital que contiene toda los atributos, propiedades y características
asociadas a cada tipo de objeto.

Para identificar a qué clase pertence un objeto, podemos aplicar la siguiente función:"

class(var.1)
class(var.2)
class(var.3)
class(var.4)
class(var.5)

"Conocer el tipo de clase es fundamental para poder realizar operaciones, ya que
de ellas dependerá el resultado

Las operaciones entre variabes numéricas no causan confusión, pero vamos a
probar las siguientes operaciones para ver algunas implicaciones:"

var.2 + var.4
var.3 + var.4

var.2 * var.4
var.3 * var.4

var.1 + var.2
var.1 * var.3

var.4 + var.5
var.4 * var.5
