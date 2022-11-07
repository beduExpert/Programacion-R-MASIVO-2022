## RETO 01: DISTRIBUCIÓN BINOMIAL
"Una maquina de ensamblaje, tiene una probabilidad de 0.05 de ensambar de forma 
defectuosa una una unidad. Si la producción de una unidad es totaltamente independiente 
de las demás y al día se producen 10 unidades:"
set.seed(0202)

"a) Grafica la función de distribución de la variable aleatoria. (Asume que se obtienen 
10,000 muestras)"
binom <- rbinom(n = 10000, size = 10, prob = 0.15)
barplot(table(binom)/length(binom),
        main = "Distribución Binomial", 
        xlab = "# unidades defectuosas")

"b) ¿Cuál es la probabilidad de que se produzcan dos unidades defectuosas?"
dbinom(x = 2, size = 10, prob = 0.15)

"c) ¿Cuál es la probabilidad de que a lo mucho 4 unidades sean defectuosas?"
pbinom(q = 4, size = 10, prob = 0.15)

"d) ¿Cuál es la probabiliad de que por lo menos tres unidades se encuentren defectuosa?"
1 - pbinom(q = 2, size = 10, prob = 0.15)

"e) ¿Cuál es la probabilidad de que entre 2 y 4 unidades se encuentren defectuosas"
pbinom(q = 4, size = 10, prob = 0.15) - pbinom(q = 2, size = 10, prob = 0.15)

"f) ¿Cuál es el número esperado de unidades defectuosas? ¿Con qué variación?"
mean(binom)
sd(binom)
