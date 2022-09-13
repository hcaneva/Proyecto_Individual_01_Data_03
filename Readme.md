# Proyecto Individual 01 - Data 03
## Creación de una API con Fast API

Este proyecto individual consite en ingestar una base de datos a partir de la informacion enviada y, utilizando FastAPI, realizar y mostrar una serie de consultas a la base de datos.

## Limpieza, Normalizacion e Ingesta de datos

-Los archivos a ingestar se encuentrar en la carpeta "Datos", los mismos se encuntran listos para agregar a la base de datos.<br>

-La base de datos a utilizar está hecha en MySQL Workbench de manera local.<br>

-La query para la ingesta de la base de datos y creacion de relaciones se ecuentra en el archivo [Database.sql](mysql/Database.sql)<br>
   ### Corroboramos las relaciones SQL y tablas creadas en la siguiente imagen<br>
<img src="images/Diagrama.png"  height="440"><br>

## Como correr la API

-Ingestar los datos en una base de datos, en este caso se utiliza MySQL Workbench<br>

-Instalar los modulos necesarios para correr el entorno sin problemas:<br>
-FastAPI    
    ``` 
    pip install fastAPI
    ``` <br>
-SQL Alchemy       
    ``` 
    pip install sqlalchemy
    ```<br>
-Pandas     
    ``` 
    pip install pandas
    ```<br>
-Uvicron     
    ``` 
    pip install uvicorn
    ```<br>

-Cambiar la siguiente linea del archivo [database.py](Sql_App/database.py) por:<br>
``` 
engine = create_engine("mysql+pymysql://TU_USUARIO:TU_CONTRASEÑA@localhost:TU_PUERTO/TU_BASE_DE_DATOS")
```
<br>

-Abrir una terminal y, dentro de la carpeta contenedora del archivo [main.py](Sql_App/main.py) ("../FastAPI-SQL/Sql-App/"), correr la Api con el siguiente comando:<br>

``` 
uvicorn main:app --reload
```
<br>

Ahora la API esta corriendo y podemos ingresar a la misma en la siguiente direccion:<br>

http://127.0.0.1:8000/docs<br>

<img src="images/direccion.png"  height="140"><br>

## Como utilizar la API

Nos encontraremos con cuatro consultas:<br>
- Año con más carreras<br>
- Piloto con mayor cantidad de primeros puestos<br>
- Nombre del circuito más corrido<br>
- Piloto con mayor cantidad de puntos en total, cuyo constructor sea de nacionalidad sea American o British<br>

Debemos seleccionar la consulta deseada:<br>
<img src="images/index.png"  height="240"><br>

Luego, seleccionar "Try it Out":<br>
<img src="images/tryitout.png"  height="390"><br>

Ejecutar:<br>
<img src="images/ejecutar.png"  height="287"><br>

A continuacion podemos observar el resultado de la consulta:<br>
<img src="images/resultado.png"  height="470"><br>

## Video demo

Les dejo el link al [video demo](https://youtu.be/4ekn7xf1HY0) donde se explica detalladamente la creacion de la API.


## Author 
[Hugo Caneva](https://github.com/hcaneva)