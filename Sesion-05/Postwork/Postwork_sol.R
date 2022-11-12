"El data frame iris contiene información recolectada por Anderson sobre 50 flores 
de 3 especies distintas (setosa, versicolor y virginca), incluyendo medidas en 
centímetros del largo y ancho del sépalo así como de los pétalos.

Estudios recientes sobre las mismas especies muestran que:
- 1) En promedio, el largo del sépalo de la especie setosa (Sepal.Length) es igual a 5.7 cm
- 2) En promedio, el ancho del pétalo de la especie virginica (Petal.Width) es menor a 2.1 cm
- 3) En promedio, el largo del pétalo de la especie virgínica es 1.1 cm más grande
      que el promedio del largo del pétalo de la especie versicolor.
- 4) En promedio, no existe diferencia en el ancho del sépalo entre las 3 especies.

Utilizando pruebas de inferencia estadística, concluye si existe evidencia suficiente 
para concluir que los datos recolectados por Anderson están en línea con los nuevos 
estudios. 

Utiliza 99% de confianza para toda las pruebas, en cada caso realiza el planteamiento 
de hipótesis adecuado y concluye."

"1) Planteamiento de hipótesis:
Ho: prom_sepal_length_setosa == 5.7
Ha: prom_sepal_length_setosa =! 5.7"

t.test(iris[iris$Species == 'setosa', "Sepal.Length"], 
            alternative = 'two.sided', mu=5.1)

"2) Planteamiento de hipótesis:
Ho: prom_petal_width == 2.1
Ha: prom_petal_width =! 2.1"
t.test(iris[iris$Species == 'virginica', "Petal.Width"], 
       alternative = 'less', mu=2.1)

"3) Planteamiento de hipótesis:
Ho: prom_petal_width == 2.1
Ha: prom_petal_width =! 2.1"
var.test(iris[iris$Species == "virginica", "Petal.Length"], 
         iris[iris$Species == "versicolor", "Petal.Length"], 
         ratio = 1, alternative = "two.sided")

t.test(iris[iris$Species == "virginica", "Petal.Length"],
       iris[iris$Species == "versicolor", "Petal.Length"],
       alternative = "greater", mu = 1.1, var.equal = TRUE)

"3) Planteamiento de hipótesis:
Ho: prom_petal_width == 2.1
Ha: prom_petal_width =! 2.1"

boxplot(Sepal.Width ~ Species, data = iris)

anova <- aov(Sepal.Width ~ Species,
             data = iris)

summary(anova)
