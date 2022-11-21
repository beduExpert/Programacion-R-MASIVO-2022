# Reto 1. Modelos ARMA de primer orden

#### Objetivo
Estimar modelos AR, MA y ARMA

#### Desarrollo
Un modelo autorregresivo es aquel donde el comportamiento en el tiempo de una serie 
es explicado por el primer rezago de su comportamiento, es decir:
y[t]=b*y[t-1] + w[t], donde b es el coeficiente del término autorregresivo y w es 
una serie ruído blanco.

1) Coloca el número diez como semilla

2) Simula un proceso AR(1) de la forma x[t] = 0.8 * x[t-1] + w[t] para t = 1, 2, ..., 200 
y muestra gráficamente la serie de tiempo obtenida


3) Obtén el correlograma y el correlograma parcial del proceso AR(1) simulado


4) Ajusta un modelo autorregresivo a la serie simulada utilizando la función ar, 
observa el orden del modelo y los parámetros estimados. ¿Coinciden con el modelo original?

