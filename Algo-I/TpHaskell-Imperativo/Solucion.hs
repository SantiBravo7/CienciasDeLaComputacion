-- Nombre de Grupo: NoCompilaVIUS
-- Integrante 1: Santiago Bravo, santolau2013@gmail.com, 750/22
-- Integrante 2: Ivo Lamonica, ivolamonicam@gmail.com, 66/22
-- Integrante 3: Valentino Pons, valentinopons@gmail.com, 614/22
-- Integrante 4: Uma Barrios, umibarrioss@gmail.com, 451/22

module Solucion where
type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us


--EJERCICIO 1
{- Le damos una RedSocial y devuelve una lista con los nombres que la componen, sin repetidos.
 Obtenemos el primerUsuarioDeLaRed para hacer la iteracion con todos los usuarios.
-}
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios ([],_,_)= []
nombresDeUsuarios ((x:xs),y,z) = eliminarRepetidos(primerUsuarioDeLaRed ((x:xs),y,z) ++ nombresDeUsuarios ((xs),y,z))

primerUsuarioDeLaRed :: RedSocial -> [String]
primerUsuarioDeLaRed r = [nombreDeUsuario (head (usuarios r))]

pertenece :: Eq t => t -> [t] -> Bool
pertenece y []= False
pertenece y (x:xs) | y == x = True
                   | otherwise = pertenece y xs

eliminarRepetidos :: Eq t => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | pertenece x xs == True = eliminarRepetidos xs
                         | otherwise = x : eliminarRepetidos xs

--EJERCICIO 2
{-relacionesDeUsuario recibe la lista con todas las relaciones de la red social, un usuario,
 y me devuelve una lista solo con las relaciones del usuario ingresado. A esa lista le saco el usuario que
 ingresé, dejando sólo a los amigos.
-}
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe r u = (sacarUsuario (relacionesDeUsuario (relaciones (r)) u ) u)

relacionesDeUsuario :: [Relacion] -> Usuario -> [Relacion]   
relacionesDeUsuario [] u = []
relacionesDeUsuario (r:rs) u | existeRelacion u r = [r] ++ relacionesDeUsuario rs u
                             | otherwise = [] ++ relacionesDeUsuario rs u

sacarUsuario :: [Relacion] -> Usuario-> [Usuario] 
sacarUsuario [] u = []
sacarUsuario (x:xs) u = obtenerAmigo x u ++ sacarUsuario xs u 
                                   
obtenerAmigo :: Relacion-> Usuario -> [Usuario]
obtenerAmigo (a,b) u | a == u =  [b]
                     | otherwise = [a]

existeRelacion :: Usuario-> Relacion-> Bool             
existeRelacion u (u1, u2) | u == u1 || u== u2  = True   
                          | otherwise = False  

--EJERCICIO 3
--Vemos la longitud la lista de amigosDe
longitud :: [Usuario] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos r u = longitud (amigosDe r u) 


--EJERCICIO 4
{-Comparamos si el primer usuario tiene más amigos que el segundo, y dejamos al que tenga más
en la lista, así sucesivamente, hasta que quede uno solo
-}
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ([x],r,p) = x
usuarioConMasAmigos ((x:y:xs),r,p) | cantidadDeAmigos ((x:y:xs),r,p) x <= cantidadDeAmigos((x:y:xs),r,p) y = usuarioConMasAmigos ((y:xs),r,p)
                                   | otherwise = usuarioConMasAmigos ((x:xs),r,p)


--EJERCICIO 5
--Si existe alguien con más de 10 amigos (para no poner un millón) es Roberto Carlos
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos ([],_,_) = False
estaRobertoCarlos r = cantidadDeAmigos r (usuarioConMasAmigos r) > 10


--EJERCICIO 6
--Con la lista de publicaciones de toda la red social y un usuario devolvemos sus publicaciones.
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (_,_,[]) u = []
publicacionesDe r u = esDe (publicaciones r) u

esDe :: [Publicacion] -> Usuario ->[Publicacion]
esDe [] u = []
esDe ls u | usuarioDePublicacion (head ls) == u = [head ls] ++ esDe (tail ls) u    
          | otherwise = esDe (tail ls) u


--EJERCICIO 7
--Dando un usuario, vemos a qué publicaciones le puso like, y devolvemos esa lista de publicaciones.
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA r u =  likesEnPublicaciones (publicaciones r) u

likesEnPublicaciones:: [Publicacion] -> Usuario -> [Publicacion]
likesEnPublicaciones [] u = []
likesEnPublicaciones (x:xs) u | lePusoMg x u  == True = [x] ++ likesEnPublicaciones xs u
                              | otherwise = likesEnPublicaciones xs u

lePusoMg :: Publicacion -> Usuario -> Bool
lePusoMg (x,y,[]) u = False
lePusoMg (x,y,(z:zs)) u | z == u = True
                        | otherwise = lePusoMg (x,y,(zs)) u

--EJERCICIO 8
-- Toma dos listas de publicaciones (a las que le habían dado like) y chequea si son iguales.
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones r u1 u2 = publicacionesQueLeGustanA r u1 == publicacionesQueLeGustanA r u2

--EJERCICIO 9
{- Con la lista de usuarios que le dieron like a una publicación, vemos si algun usuario se repite
en toda la lista de publicaciones (está en todas), de ser así es un seguidor fiel.
Si es él mismo, lo saca de la lista y sigue viendo los otros.
-}
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel (_,_,[]) u = False
tieneUnSeguidorFiel r u = algunoEsFiel r u (usuarios r)

algunoEsFiel ::  RedSocial-> Usuario -> [Usuario] -> Bool
algunoEsFiel  r u [] = False
algunoEsFiel  r u (x:xs) | x == u = algunoEsFiel r u xs
                         | usuarioLeDioLikeATodas(publicacionesDe r u) x = True
                         | otherwise = algunoEsFiel r u xs

usuarioLeDioLikeATodas :: [Publicacion] -> Usuario -> Bool
usuarioLeDioLikeATodas [] u = True
usuarioLeDioLikeATodas (x:xs) u | lePusoMg x u == False = False
                                | otherwise = usuarioLeDioLikeATodas xs u


--EJERCICIO 10
{- Le damos los amigos del u1 y verificamos si u2 se encuentra allí, de no ocurrir vemos si creció la bolsa,
y si no creció la bolsa, agrega amigos de amigos a la bolsa, repitiendo el proceso con una bolsa más grande
-}

existeSecuenciaDeAmigos:: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos r u1 u2 | u1==u2 = False
existeSecuenciaDeAmigos r u1 u2 = secuenciaDeAmigos r u1 u2 (amigosDe r u1)

secuenciaDeAmigos :: RedSocial -> Usuario -> Usuario-> [Usuario] -> Bool
secuenciaDeAmigos r u1 u2 bolsa | pertenece u2 bolsa = True
                                | crecio bolsa (agregaAmigos r bolsa)==False = False
                                | otherwise= secuenciaDeAmigos r u1 u2 (agregaAmigos r bolsa)

agregaAmigos :: RedSocial -> [Usuario] -> [Usuario] 
agregaAmigos r [] = []
agregaAmigos r (x:xs) = eliminarRepetidos((x:xs) ++ (amigosDe r x) ++ agregaAmigos r xs)

crecio:: [Usuario]->[Usuario]->Bool
crecio x y | longitud x == longitud y = False
                  | otherwise = True
