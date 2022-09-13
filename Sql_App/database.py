#Importamos slqalchemy
from sqlalchemy import create_engine

# Utilizaremos la función create_engine() para encender el motor sql que comunicará nuestras consultas a la base de datos
engine = create_engine("mysql+pymysql://root:root@localhost:3306/PI01")