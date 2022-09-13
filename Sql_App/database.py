#Importamos slqalchemy
from sqlalchemy import create_engine

# Utilizaremos la función create_engine() para encender el motor sql que comunicará nuestras consultas a la base de datos
engine = create_engine("mysql+pymysql://TU_USUARIO:TU_CONTRASEÑA@localhost:TU_PUERTO/TU_BASE_DE_DATOS")
