from fastapi import FastAPI
import consultas

#creamos la instancia de FastAPI
app = FastAPI()

#Funciones

@app.get("/Mayor cantidad de carreras en un año")
async def get_cant_carreras():
    return {"La mayor cantidad de carreras en un año fueron" : consultas.df1_cant_carreras, "en el año" : consultas.df1_año}

@app.get("/Piloto con mayor cantidad de primeros puestos")
async def get_cant_primer_lugar():
    return {"El piloto con mayor cantidad de primeros puestos es" : consultas.df2_piloto, "La cantidad de veces que salio en primer lugar fueron" : consultas.df2_cant_prim}

@app.get("/Circuito mas corrido")
async def get_cant_circuito():
    return {"El circuito donde mas veces se corrió es" : consultas.df3_circuito, "Gran Premio" : consultas.df3_GP, "La cantidad de carreras disputadas fueron" : consultas.df3_cant}

@app.get("/Piloto con mas puntos con constructor Ingles o Americano")
async def get_cant_puntos():
    return {"La escudería" : consultas.df4_brand, "De origen" : consultas.df4_pais, "Hizo un total de puntos" : consultas.df4_puntos, "Con el piloto" : consultas.df4_piloto}