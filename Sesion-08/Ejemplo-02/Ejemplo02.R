## EJEMPLO 02: CONEXIONES CON DATABASE MANAGMENT SYSTEMS
"La paquetería DBI nos ayuda a generar conexiones a DBMS dentro de nuestra sesión 
de R, para ello, la paquetería separa la conexión en back-end y front-end.
El back-end es manejado por la librería DBI, en la cual podemos establecer y cerrar 
conexiones, ejecturar SQL queries, entre otras funciones administrativas

El front-end depende del servicio de DBMS:
-MySQL: RMySQL
-Postgres: RPostgres
-SQLite: RSQLite
entre muchos otros.

Algunas de estas librarías para front-end necesitan tener instalado explícitamente 
DBI, como es el caso de RMySQL:"
install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)

"Para realizar una conexión, necesitamos un engine que nos ayude a establecer el nombre 
del servidor (servidio de DBMS), el nombre de la base de datos, host y, en su caso,
usuario y contraseña:"
db.conn <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

"Con la siguientes todas las tablas de datos que tenemos disponibles en nuestro database 
y enlistar el nombre de los campos en cada una de ellas:"
dbListTables(db.conn)

dbListFields(db.conn, 'City')
dbListFields(db.conn, 'Country')
dbListFields(db.conn, 'CountryLanguage')

"La función dbGetQuery() nos permite realizar una consulta y extraer los datos obtenidos."
db.data <- dbGetQuery(db.conn, 
                      "SELECT a.Name AS City
                            , a.District
                            , a.Population AS CityPopulation
                            , b.Name AS Country
                            , b.Population AS CountryPopulation
                      FROM City AS a
                      INNER JOIN Country AS b
                      ON a.CountryCode = b.Code
                      ORDER BY CityPopulation DESC")

"Los datos son almacenados en un dataframe, por lo que podemos user otras funciones 
para manipularlos, procesarlos y transformarlos."
class(db.data)
head(db.data)

"En algunas ocasiones ejecutaremos queries para crear, eliminar o alterar tablas (DDL),
o para dar o revocar permisos, las cuales no regresan datos que podemos almacenar en un 
dataframe. (DCL). Como la conexión que estamos realizando es una databse pública, nos podemos 
implementar DDL o DCL, pero podemos ejemplificarlo de la siguiente forma:"
rs <- dbSendQuery(db.conn, "SELECT '¡Hola, mundo!' AS saludo")

dbFetch(rs)
dbClearResult(rs)

"Una vez terminadas nuestras consultas, debemos cerrar nuestra conexión:"
dbDisconnect(db.conn)
