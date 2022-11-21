# Reto 02: Conexiones con Postgres

"El Instituto Europeo de Bioinformática promociona un recursos públicos y gratuitos 
para el desarollo de investigación de secuencias de ADN a través de RNACentral .
el cual proporciona una conexión gratuita a su database en Postgres. Para acceder al database 
'pfmegrnargs', se requiere conectarse el host ('hh-pgsql-public.ebi.ac.uk'), a través 
del port 5432, con el user 'pfmegrnargs' y password 'NWDMCE5xdipIjRrp':

NOTA: Ingresa a https://dbi.r-dbi.org/ para obtener más información sobre cómo establecer 
conexión con DBI y otros db como Postgres.
"
#1) Instala y carga las siguientes librerías
install.packages("RPostgres")
library(RPostgres)
library(DBI)

#2) Con base en los argumentos dados en la descripción del reto, establece una conexión 
# a la base de datos de Postgress
db.conn <- dbConnect(
  RPostgres::Postgres(),
  host = "hh-pgsql-public.ebi.ac.uk",
  port = 5432,
  dbname = "pfmegrnargs",
  user = "reader",
  password = "NWDMCE5xdipIjRrp")

"3)Entre otras tablas, el database contiene información sobre el ADN en las tablas 'rna' y 
'rnc_rna_precomputed'. Enlista las variables de cada tabla:"
dbListFields(db.conn, 'rna')
dbListFields(db.conn, "rnc_rna_precomputed")

"4) Utilizando las tablas antes mencionadas, realiza una consulta de datas haciendo un INNER JOIN
entre ambas tablas utilizando 'upi' como llave. De la tabla rna selecciona el id, upi, crc64 y len.
De la tabla rnc_rna_precomputed selecciona rna_type y is_active. Selecciona sólo aquellas entradas 
donde is_active sea FALSE (como string) y ordena de forma ascendente con base en len"
db.data <- dbGetQuery(db.conn, 
                      "SELECT a.id
                              , a.upi
                              , a.crc64
                              , a.len
                              , b.rna_type
                              , b.is_active
                      FROM rna AS a
                      INNER JOIN rnc_rna_precomputed AS b
                      ON a.upi = b.upi
                      WHERE b.is_active = 'FALSE'
                      ORDER BY a.len
                      LIMIT 10;")
#5) Revisa los datos obtenidos y cierra la conexión
db.data
dbDisconnect(db.conn)

"NOTAS: Para consultar más información sobre el database de RNACentral, entra a :
https://rnacentral.org/help/public-database"
