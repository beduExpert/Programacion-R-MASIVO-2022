# Ejemplo 3. Listas y data frames

# Objetivo

- Crear listas y data frames
- Extraer información de estos

# Requisitos

1. Haber estudiado el prework
2. Tener previamente instalados R y RStudio

# Desarrollo

Las listas son muy parecidas a los vectores, salvo que estas pueden tener objetos de distinto tipo como variables, vectores, matrices, dataframes e 
incluso otros listas.

Para crea una lista, basta llamar la función list() con la serie de elementos a guardar como argumentos de la función identificados por un nombre:
```R
lista <- list(string = "Pepe", 
              numeric = 3,
              vector = c(4, 7, 9),
              matrix = matrix(1:9, nrow = 3, ncol = 3),
              lista2 = list(a = "Hola", b = "Mundo")
              )
class(lista)
lista
```

La listas poseen atributos a los cuales se puede acceder mediante el operador $
```R
str(lista)

lista$matrix
lista$lista2
lista$lista2$b
```

Los Dataframe son muy parecidos a las matrices, salvo que estos pueden tener vectores de distintos tipos.

Para crea una lista, basta llamar la función data.frame() y agregar los vectores columnas con su respectivo nombre:
```R
x <- 10:21
y <- letters[x]

df <- data.frame(edad=10:21, 
                 grupo=letters[x]
                 )
class(df)
df

str(df)
names(df)
```

Se pueden agregar y eliminar columnas de ls siguiente manera:
```R
df$sexo <- c("H", "M", "H", "M", "H", "H", "M", "H","H","M", "M", "H")
df

df$edad <- NULL
df
```

Los Dataframes pueden descargarse en una gran variedad de formatos, siendo .csv uno de los más utilizados
```R
write.table(x=df, file="primer_df.csv", col.names = TRUE)

