from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def mesetaMasLarga(l: List[int]) -> int :
  longitudDeMeseta:int = 0
  
  if(len(l) == 0):
    longitudDeMeseta = 0

  else:
    contenedorDeListas: List[List[int]] = [[]]
    primerelemento:int = l[0]
    primeraLista: List[int] = []

    for i in range(0 ,len(l) , 1):
      if(l[i] == primerelemento):
        primeraLista.append(primerelemento)

      else:
        contenedorDeListas.append(primeraLista)
        primeraLista = []
        primerelemento = l[i]
        primeraLista.append(primerelemento)
    
    contenedorDeListas.append(primeraLista)

    longitudActual = len(contenedorDeListas[0])

    for i in range (1 , len(contenedorDeListas) , 1):
      if(longitudActual < len(contenedorDeListas[i])):
        longitudActual = len(contenedorDeListas[i])

    longitudDeMeseta = longitudActual
      
  return longitudDeMeseta

if __name__ == '__main__':
  x = input()
  print(mesetaMasLarga([int(j) for j in x.split()]))