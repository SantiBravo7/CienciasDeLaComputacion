from queue import LifoQueue as Pila
import random

def generarNrosAlAzar(n:int, desde:int, hasta:int) -> list[int]:
    p = Pila()
    numero: int = random.randint(desde,hasta)
    for i in range(n):
        p.put(numero)
        numero = random.randint(desde,hasta)
    return p

def imprimirPila(p):
    while not (p.empty()):
        elemento:int = p.get()
        print(elemento)

imprimirPila(generarNrosAlAzar(10,1,9999))

def maximo(pila: Pila)->int:
    if(pila.empty()==False):
        maximo_actual=pila.get()
    while(pila.empty()==False):
        posible_maximo=pila.get()
        
        if(maximo_actual<posible_maximo):
            maximo_actual=posible_maximo
            
    return maximo_actual

pila_vir=generarNrosAlAzar(10,1,9999)
print("Imprimir pila vir:")
imprimirPila(pila_vir)
print("imprimir maximo")
print(maximo(generarNrosAlAzar(10,1,9999)))