from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def filasParecidas(matriz: List[List[int]]) -> bool :
  if len(matriz) == 0 :
      return False
  else:
      primerFila:List[int]= matriz[0]
      for i in range(1,len(matriz)):
        res:List[int] = restar2Listas(primerFila,matriz[i])
        if todosIguales(res) == False:
         return False
      return True

def restar2Listas(ls1:List[int],ls2:List[int])->List[int]:
  res:List[int] =[]
  for i in range(0,len(ls1)):
    valor:int = ls2[i]-ls1[i]
    res.append(valor)
  return res

def todosIguales(ls:List[int])->bool:
  listaN :List[int] =[]
  for numero in ls:
    listaN.append(numero)
  for num in listaN:
     if num != numero:
       return False
  return True  

if __name__ == '__main__':
  filas = int(input())
  columnas = int(input())
 
  matriz = []
 
  for i in range(filas):         
    fila = input()
    if len(fila.split()) != columnas:
      print("Fila " + str(i) + " no contiene la cantidad adecuada de columnas")
    matriz.append([int(j) for j in fila.split()])
  
  print(filasParecidas(matriz))