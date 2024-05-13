#    GUIA 10
from queue import LifoQueue as Pila
from typing import List
import random
pila = Pila() #pila vacia
#ejercicio 2.8

def generarNrosAlAzar(n : int,  desde : int, hasta : int)->List[int]:
    lista = range(desde,hasta)
    res = random.sample(lista,n)
    return res
"""
#ejercicio 2.9
def pilaAlAzar(n:int, desde: int, hasta:int)->Pila:
    pila = Pila()
    res=generarNrosAlAzar(n, desde, hasta)
    for i in range (len(res)):
        pila.put(res[i])
    return pila
            
def imprimirPila(pila:Pila):
    while pila != pila.empty() :  #mientras pila no sea una pila vacia
        print(pila.get(-1))       #pila.get(-1) toma el ultimo elemento de la pila y lo saca de esta misma

        
#ejercicio 2.10
def cantidadElementos(p : Pila)->int:
    cantidad = 0
    while p != p.empty():
        p.get(-1)
        cantidad += 1
    return cantidad

pila = [1,2,3,5,4,8,6]

print(cantidadElementos(pila))
"""
def mult10(x:int)->int:
    res:int = 0 
    i: int = 0
    while i < 10:
        res = res + x
        i = i + 1
    return res

def sumar(x:int, y:int)->int:
    sumando = 0
    abs_y = 0
    if y < 0:
        sumando = -1
        abs_y = -y
    else:
        sumando = 1
        abs_y = y
    res = x
    i = 0
    while i < abs_y:
        res = res + sumando
        i = i + 1
    return res 

def mcd(x:int, y:int)->int:
    assert(x>=0, y >=0)
    tmp:int = 0
    while y != 0:
        tmp = x % y
        x = y
        y = tmp
    return x
