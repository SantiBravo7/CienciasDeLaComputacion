import sys

def quienGana(j1: str, j2: str) -> str: 
    jugador1 = "Jugador1"
    jugador2 = "Jugador2"
    empate = "Empate"
    if (j1 == "Piedra" and j2 == "Tijera"):
        return jugador1 
    elif (j1 == "Papel" and j2 == "Piedra"):
        return jugador1
    elif (j1 == "Tijera" and j2 == "Papel"):
        return jugador1
    elif (j2 == "Piedra" and j1 == "Tijera"):
        return jugador2        
    elif (j2 == "Papel" and j1== "Piedra"):
        return jugador2
    elif (j2 == "Tijera" and j1 == "Papel"):
        return jugador2
    else:
        return empate

if __name__ == '__main__':
  x = input()
  jug = str.split(x)
  print(quienGana(jug[0], jug[1]))