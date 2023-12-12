#Dada una pila de enteros, implementar una funci ́on buscarElMaximo(in p : pila) → int que devuelva el m ́aximo
#elemento

from queue import LifoQueue as Pila
import random
pila = Pila #pila vacia

#pila.put(l)
def pila_aleatoria(cantidad:int)-> Pila:
    pila= Pila() #Pila vacia
    for i in range(cantidad):
        numero= random.randint(1,100)
        pila.put(numero)
    return imprimirPila(pila)

def imprimirPila(pila:Pila):
    while pila != pila.empty():
        print(pila.get(-1))       
print(pila_aleatoria(4))
"""
#requiere pila>0. Este recibe un parametro inout
def maximo(pila: Pila)->int:
    if(pila.empty()==False):
        maximo_actual=pila.get()
    while(pila.empty()==False):
        posible_maximo=pila.get()
        
        if(maximo_actual<posible_maximo):
            maximo_actual=posible_maximo
            
    return maximo_actual

pila_vir=pila_aleatoria(10)
print(pila_vir)
elemento_maximo= maximo(pila_vir)
print(elemento_maximo)

#En realidad la especificacion pedia que sea un parametro int
#Creo una funcion copiar_pila para no modificar la funcion original
def copiar_pila(una_pila: Pila)->Pila:
    lista_intermedia=[]
    nueva_pila=Pila()
    
    #construyo lista intermedia
    while(pila.empty()==False):
        lista_intermedia.append(una_pila.get())
        
    #reconstruyo la pila original y la nueva
    cantidad= len(lista_intermedia)
    for i in range(cantidad):
        elemento = lista_intermedia[cantidad-1-i]
        nueva_pila.put(elemento)
        una_pila.put(elemento)
        # dos puts pq uno es la original y la otra es la nueva que
        #quiero devolver para poder modificar
    return nueva_pila
        

def cantidadElementos(pila:Pila)->int:
    contador=0
    for p in range(len(pila)):
        pila[p]
        contador+=1
    return contador
print(cantidadElementos(pila))

def contarlineas( nombre_archivo : str) -> int:
    cantidad : int = 0
    archivo = open(nombre_archivo,'r')  
    while archivo.readline() != '':
        cantidad += 1
    archivo.close()
    return cantidad
"""
#Diccionarios:
#20 Implementar la funcion laPalabraMasFrecuente(in nombre archivo : str) → str que devuelve la palabra que
#más veces aparece en un archivo de texto.

#def laPalabraMasFrecuente()