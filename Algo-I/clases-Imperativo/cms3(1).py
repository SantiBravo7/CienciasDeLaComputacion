from queue import Queue 
from typing import List, Dict
"""
cola = Cola()
cola.put(1)
cola.put(2)
cola.put(3)
min:int = 5

def imprimirCola(cola:Queue)->Queue:
    nuevaCola = []
    if cola == []:
        return nuevaCola
    else:
        while(not(cola.empty())):
            x = cola.get()
            nuevaCola.append(x)
    return nuevaCola

def avanza_Fila(fila:Queue, min:int)->Queue:
    ultimapersona = fila.qsize()
    caja1 = 1
    caja2 = 3
    caja3 = 2
    tiempoDeEspera = -1
    for minuto in range(0,min+1):   
        if minuto % 4==0:
            fila.put(ultimapersona+1)
            ultimapersona = ultimapersona + 1
        if not(fila.empty()):
            if minuto % 10 == caja1 % 10:
                fila.get()
                caja1 = caja1 + 10
            elif minuto % 4 == caja2 % 4:
                fila.get()
                caja2 = caja2 + 4
            elif minuto % 4 == caja3 % 4:
                x=fila.get()
                tiempoDeEspera = minuto + 3
            elif minuto == tiempoDeEspera:
                fila.put(x)
                tiempoDeEspera=0
    return imprimirCola(fila)




print(avanza_Fila(cola,min)) 


 ejercicio 3

elementos=[ {   "a" : 2,
                "b" : 4,
                "c" : 0,
                "d" : 8},
           
            {   "a" : 8,
                "b" : 12,
                "c" : 36,
                "e" : 8}
]
#print(elementos[0]["a"])
def devolver_Claves(diccionaio:Dict[str,str])->Dict[str,List[int]]:
    claves = diccionaio.keys()
    sonClaves : List[str] = []
    for clave in claves:
        sonClaves.append(clave)
    return sonClaves

#print(devolver_Claves(traductor))

def devolver_Valores(diccionaio:Dict[str,str])->Dict[str,List[int]]:
    valores = diccionaio.values()
    sonValores : List[str] = []
    for valor in valores:
        sonValores.append(valor)
    return sonValores

#print(devolver_Valores(traductor))

def unir_Diccionarios(a_unir: List[Dict[str,int]]) ->Dict[str, List[str]]:
    diccionarioFinal: Dict = dict()
   
    for diccionario in a_unir:
        keys = diccionario.keys()
        for key in keys:
                valoresFinales:Cola=Cola()
                valor = diccionario.get(key)
                diccionarioFinal[key]=valoresFinales
                valoresFinales.put(valor)
                diccionarioFinal[key]=imprimirCola(valoresFinales)
        valoresFinales.put(valor)
        diccionarioFinal[key]=imprimirCola(valoresFinales)
    return diccionarioFinal


print(unir_Diccionarios(elementos))

ejercicio 4"""

pedidos = [
    {
        "id" : 21,
        "nombre" : "lucas",
        "productos": {"manzana": 2}
    },
    {
        "id" : 22,
        "nombre" : "Salomon",
        "productos": {"pan": 2, "gaseosa" : 3, "factura": 6}
    }
]

stock_Productos = {"manzana": 2, "pan" : 6, "facturas" : 12}
precio_Productos = {"manzana": 2.5, "pan" : 3.6, "facturas" : 1.2}