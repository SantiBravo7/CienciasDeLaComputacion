from typing import List
from typing import Tuple

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  if buscarOrigen(origen,vuelos)==[] or buscarDestino(destino,vuelos)==[]:
    return -1
  
  primerViaje: Tuple[str, str]=buscarOrigen(origen,vuelos)
  rutaDeViaje:List[Tuple[str, str]]=[primerViaje] 
   
  if rutaDeViaje[-1][1]==destino:
    return len(rutaDeViaje)
  
  i:int=0
  while(i<len(vuelos)):
    if rutaDeViaje[-1][1]==vuelos[i][0]:
      rutaDeViaje.append(vuelos[i])
      i=0
      if rutaDeViaje[-1][1]==destino:
        return len(rutaDeViaje)
      elif rutaDeViaje[-1][1]==origen:
        return -1
    i+=1
  return -1

def buscarOrigen(origen:str,vuelos:List[Tuple[str, str]])->Tuple[str,str]:
  for i in range(0,len(vuelos),1):
    if vuelos[i][0]==origen:
      return vuelos[i]
  return []

def buscarDestino(destino:str,vuelos:List[Tuple[str, str]])->Tuple[str,str]:
  for i in range(0,len(vuelos),1):
    if vuelos[i][1]==destino:
      return vuelos[i]
  return []

if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))

