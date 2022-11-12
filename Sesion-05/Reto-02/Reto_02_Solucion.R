# Reto 02: Inferencia sobre la media

"Utilizando la base de datos de mpg (Fuel Economy Data) disponible en la librería 
de ggplot2, realiza los siguientes ejercicios indicando el juego de hipótesis y 
concluyendo de forma estadística a un nivel de confianza del 95%"
library(ggplot2)

"1) Con base en los datos, existe evidencia estadística para concluir que, en promedio, 
los coches producidos entre 1999 y 2008 podían recorrer más de 22.8 millas de 
carretera por galón (hwy)?"

"Planteamiento de hipótesis:
Ho: prom_hwy <= 22.8
Ha: prom_hwy > 22.8"
t.test(mpg$hwy, alternative = 'greater', mu=22.8)

"R/ Con un NC del 95%, no existe evidencia estadística para rechazar Ho, es decir, 
, en promedio, los coches producidos entre 1999 y 2008 podían recorrer 22.8 millas de 
carretera por galón o menos"

"2) Con base en los datos, existe evidencia estadística para concluir que, en promedio, 
el desplazamiento del motor en litros (displ) para los coches producidos entre 
1999 y 2008 era mayor o igual 3.7 litros?"

"Planteamiento de hipótesis:
Ho: prom_displ >= 3.7
Ha: prom_displ < 3.7"
t.test(mpg$displ, alternative = 'less', mu=3.7)

"R/ Con un NC del 95%, existe evidencia estadística para rechazar Ho, es decir, 
en promedio, el desplazamiento del motor en litros (displ) para los coches 
producidos entre 1999 y 2008 era menor a 3.7 litros?"

"3) Con base en los datos, existe evidencia estadística para concluir que, en promedio, 
los motores con 4 cilindros (cyl = 4) tienen un mayor rendimiento en millas de 
carretera por galón (hwy) que los motores con 6 cilindros (cyl = 6)"

"Planteamiento de hipótesis:
Ho: prom_hwy_cyl_4 <= prom_hwy_cyl_6
Ha: prom_hwy_cyl_4 > prom_hwy_cyl_6"

var.test(unlist(mpg[mpg$cyl == 4, "hwy"]), 
         unlist(mpg[mpg$cyl == 6, "hwy"]), 
         ratio = 1, alternative = "two.sided")

t.test(mpg[mpg$cyl == 4, "hwy"], 
       mpg[mpg$cyl == 6, "hwy"], 
       alternative = "greater",
       mu = 0, var.equal = TRUE)

"R/ Con un NC del 95%, existe evidencia estadística para rechazar Ho, es decir, 
en promedio, los motores con 4 cilindros (cyl = 4) tienen un mayor rendimiento 
en millas de carretera por galón (hwy) que los motores con 6 cilindros (cyl = 6)"
