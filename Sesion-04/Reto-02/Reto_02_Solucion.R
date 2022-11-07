## EJEMPLO 02: DISTRIBUCIÓN DE POISSON Y EXPONENCIAL
"Un banco recibe, en promedio, 6 cheques sin fondo por día." 
set.seed(0202)

"a) Grafica la función de distribución de la variable aleatoria. (Asume que se obtienen 
10,000 muestras)"
poisson <- rpois(n = 10000, lambda = 6)
barplot(table(poisson)/length(poisson),
        main = "Distribución de Poisson", 
        xlab = "X=x")

"b) ¿Cuál es la probabilidad de que reciba 4 cheques sin fondo en un dia"
dpois(x = 4, lambda = 6)

"c) ¿Cuál es la probabilidad de que reciba más de 8 cheques sin fondo?"
ppois(q = 8, lambda = 6, lower.tail = FALSE)

"d) ¿Cuál es la probabilidad de que reciba entre 4 y 10 cheques sin fondo?"
ppois(q = 10, lambda = 6) - ppois(q = 4, lambda = 6)

"e) ¿Cuál es la probabilidad de que tengan que pasar 5 horas o menos hasta que 
se presente el siguiente cheque sin fondos?"
pexp(q = 5, rate = 6/24, lower.tail = FALSE)

"f) ¿Cuál es la probabilidad de que tengan que pasar entre 2 y 4 hasta que se presente 
el siguiente cheque sin fondos?"
pexp(q = 4, rate = 6/24) - pexp(q = 2, rate = 6/24)

"g) Realiza la gráfica de distribución de probabilidad de la variable aleatoria anterior"
curve(dexp(x, rate = 6/24), from=0, to=20, 
      col='blue', main = "Distribución exponencial",
      ylab = "f(x)", xlab = "Tiempo entre eventos")
