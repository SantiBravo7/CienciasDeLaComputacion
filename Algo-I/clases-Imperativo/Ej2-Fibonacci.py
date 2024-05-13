def destinos(n,v):
    destinosTotales= []
    for vuelo in n:
        if vuelo[0] in v:
            destinosTotales.append(vuelo[1])
    return destinosTotales

vuelos=[("Arg","Br"),("Chi","Bol"),("Uru","Par")]

partidas=["Arg","Chi","Uru"]

print(destinos(vuelos,partidas))