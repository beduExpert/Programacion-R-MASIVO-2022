#Reto 02: Regresión logística

"El Dataframe 'inseguridad_alimentaria' contiene información de la Encuesta Nacional 
de Salud y Nutrición (ENSANUT) 2012, específicamente del módulo de condiciones socieconómicas 
del hogar y del módulo de percepción de inseguridad alimentaria en el hogar.

Dentro del dataframe se encuentran las siguientes variables, entre otras:
- IA: 1 si el hogar presenta inseguridad alimentaria, 0 en otro caso
- numpeho: Número de personas en el hogar
- edadjef: Edad del jefe de familia
- sexojef: 0 si el jefe familia es Hombre, 1 si es Mujer
- añosedu: Años de educación del jefe de familia
- alsa: Gasto semanal en gastos alimentos saludables

El objetivo es construir un modelo que nos permita estimar el impacto que tienen variables 
socieonómicas en la probabilidad de que un hogar presente seguridad alimentaria.

Asegurate que tu modelo final sea aquel con el pseudo_r2 más alto e interpreta los 
log odds del modelo estimado.

NOTA: No olvides probar efectos de interacción"

df <- read.csv("inseguridad_alimentaria.csv")

df$IA <- factor(df$IA, labels = c("No", "Si"))
df$mened <- factor(df$mened, labels = c("No", "Si"))
df$sexojef <- factor(df$sexojef, labels = c("H", "M"))
summary(df)

attach(df)

logistic.1 <- glm(IA ~ numpeho + edadjef + edadjef:sexojef + 
                    añosedu + añosedu:sexojef + alsa + mened, family = binomial)

summary(logistic.1)

pseudo_r2.1 <- (logistic.1$null.deviance - logistic.1$deviance)/logistic.1$null.deviance
pseudo_r2.1
