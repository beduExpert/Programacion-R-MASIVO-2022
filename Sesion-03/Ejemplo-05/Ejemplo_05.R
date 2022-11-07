## EJEMPLO 5: GRÁFICAS DE DISPERSIÓN Y CORRELACIÓN
#Coeficiente de correlación de Pearson
df <- diamonds
cor(df$table, df$price)

df.select <- select(df, price, carat, depth, table)
corr_matrix <- round(cor(df.select),4)
corr_matrix

# Gráfica de dispersión
ggplot(df, aes(x=carat, y=price)) + 
  geom_point() +                                     
  stat_smooth(method = "lm",
              formula = y ~ x,
              geom = "smooth") +
  labs(title = "Gráfica de dispersión", 
       x = "Carat",
       y = "Price") + 
  theme_classic()
