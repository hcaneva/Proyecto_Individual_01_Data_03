import pandas as pd
import database

#Consultas a la base de datos

#Mayor cantidad de carreras en un año
df1 = pd.read_sql_query("Select Año, count(*) as Cant_de_Carreras from Carreras group by Año order by Cant_de_Carreras desc limit 1",database.engine)
df1_año=str(df1["Año"][0])
df1_cant_carreras=str(df1["Cant_de_Carreras"][0])

#Piloto con mayor cantidad de primeros puestos
df2 = pd.read_sql_query("select concat(JSON_UNQUOTE(P.`name`->'$.forename'),' ', JSON_UNQUOTE(P.`name`->'$.surname')) as Nombre_y_Apellido, count(*) as Cant_Primer_Lugar from Resultados R Join Pilotos P on (R.Piloto_ID=P.Piloto_ID) where R.Posicion =1 group by R.Piloto_ID order by Cant_Primer_Lugar desc limit 1",database.engine)
df2_piloto=str(df2["Nombre_y_Apellido"][0])
df2_cant_prim=str(df2["Cant_Primer_Lugar"][0])

#Circuito mas corrido
df3 = pd.read_sql_query("select I.Nombre_Circuito, C.Nombre_GP, count(*) as Cant_de_Carreras from Carreras C inner join Circuitos I on (C.Circuito_ID=I.Circuito_ID) group by C.Circuito_ID order by Cant_de_Carreras desc limit 1",database.engine)
df3_circuito=str(df3["Nombre_Circuito"][0])
df3_GP=str(df3["Nombre_GP"][0])
df3_cant=str(df3["Cant_de_Carreras"][0])

#Piloto con mayor cantidad de puntos en total, 
#cuyo constructor sea de nacionalidad sea American o British
df4 = pd.read_sql_query("select concat(JSON_UNQUOTE(P.`name`->'$.forename'),' ', JSON_UNQUOTE(P.`name`->'$.surname')) as Nombre_y_Apellido, sum(R.puntos) as Total_Puntos , C.`name` as Nombre, C.nationality as Pais from Resultados R Join Pilotos P on (R.Piloto_ID=P.Piloto_ID) join Constructores C on (R.Constructor_ID=C.Constructor_ID) where C.nationality like 'British' or C.nationality like 'American' group by R.Piloto_ID order by Total_Puntos desc limit 1",database.engine)
df4_piloto=str(df4["Nombre_y_Apellido"][0])
df4_puntos=str(df4["Total_Puntos"][0])
df4_brand=str(df4["Nombre"][0])
df4_pais=str(df4["Pais"][0])
