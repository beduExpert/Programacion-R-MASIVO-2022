library(dplyr)
visitas.rest <- read.csv(file = 'https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-02/Data/RestaurantVisitors.csv',
                                header = TRUE)
"dplyr es una de las librarías más utilizadas en R y forma parte de la familia 
de librerías de tidyverse.

La librería dplyr contiene diversas funciones para la manipulación y transformación 
de DataFrames, las cuales son muy intuitivas de aplicar ya que librería utiliza 
verbos para la ejecución de acciones"

"'select()' nos permite seleccionar una serie de variables de un DataFrame"

visitas.rest.select <- select(visitas.rest, date, spending, total)
class(visitas.rest.select)
names(visitas.rest.select)

"El primer argumento de la función select() es un dataframe, al igual que en 
el resto de funciones de dplyr. Como en muchas ocaciones vamos a encadenar 
varias funciones de dplyr a un dataframe, es útil utilizar el operador de 
pipeline 'dataframe %>% fun', el cual pasa el objeto que contiene un dataframe 
como argumento de la función:"

visitas.rest %>% select(date, spending, total)

"'arrange() ordena las filas de un dataframe de acuerdo con los valores 
de una o más variables:"

visitas.rest.orden <- visitas.rest %>%
                              select(date, spending, total) %>%
                              arrange(spending, desc(total))
head(visitas.rest.orden)

"'filter()' facilita la forma en la que indexamos o extreamos filas 
con base en condiciones lógicas:"

visitas.rest.filtro <- visitas.rest %>%
                              select(date, spending, total) %>%
                              arrange(spending, desc(total)) %>%
                              filter(spending > 1000000, spending < 1200000)
head(visitas.rest.filtro)


"'mutate()' permite transformar variables o crear nuevas a partir de otras"

visitas.rest.per.visita <- visitas.rest %>%
                                  select(date, spending, total) %>%
                                  mutate(spending_per_visit = spending / total) %>%
                                  arrange(desc(spending_per_visit))
head(visitas.rest.per.visita)


"'group_by()' y 'summarize()' son dos verbos que usualmente son usados en conjunto. 
El primero permite agrupar los datos con base en un factor (variable cualitativa), 
mientras que el segundo permite resumir la información a través de funciones
"
visitas.rest.group.summ <- visitas.rest %>%
                       select(date, holiday, spending) %>%
                       mutate(holiday = factor(holiday, labels = c("No", "Yes"))) %>%
                       group_by(holiday) %>%
                       summarize(total_spending = sum(spending),
                                 mean_spending = mean(spending),
                                 sd_spending = sd(spending))
head(visitas.rest.group.summ)
