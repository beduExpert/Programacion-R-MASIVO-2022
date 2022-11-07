## EJEMPLO 5: GRÁFICAS DE DISPERSIÓN Y CORRELACIÓN

#### Objetivo
- Conocer las medidas de asociación entre 2 variables cuantitativas
- Aprender a constuir diagramas de disperisón

#### Requisitos
- Lectura de ficheros locales y desde algún repositorio en internet
- Uso de `ggplot`

#### Desarrollo

##### Coeficiente de correlación de Pearson
```R
df <- diamonds
cor(df$table, df$price)

df.select <- select(df, price, carat, depth, table)
corr_matrix <- round(cor(df.select),4)
corr_matrix
```

##### Gráfica de dispersión
```R
ggplot(df, aes(x=carat, y=price)) + 
  geom_point() +                                     
  stat_smooth(method = "lm",
              formula = y ~ x,
              geom = "smooth") +
  labs(title = "Gráfica de dispersión", 
       x = "Carat",
       y = "Price") + 
  theme_classic()
```
