module Tests where

import Test.HUnit
import Solucion

-- casos De Test

main = runTestTT todosLosTest
todosLosTest = test [testsuite1,testsuite2,testsuite3,testsuite4,testsuite5,testsuite6,testsuite7,testsuite8,testsuite9,testsuite10]


--------------Test EJERCICIO 1
testsuite1 = test [
{-1-} "nombres normales" ~: (nombresDeUsuarios redA) ~?= ["Juan","Natalia","Pedro","Mariela"],
{-2-} "variedad de nombres con caracteres especiales" ~: (nombresDeUsuarios redC) ~?= ["C@rlos","P@b(_0","fe"," "," 4"," '"],   
{-3-} "redVacia" ~: (nombresDeUsuarios redVacia) ~?= [],
{-4-} "TodosUsuariosMismoNombre" ~: (nombresDeUsuarios redX) ~?= ["Natalia"]
      ]

--------------Test EJERCICIO 2
testsuite2= test [
{-5-} "UsuarioSinAmigos" ~: (amigosDe redX usuario2) ~?= [],
{-6-} "CasoNormalAmigosDe" ~: (amigosDe redA usuario2) ~?= [usuario1, usuario3, usuario4]
 ]

--------------Test EJERCICIO 3
testsuite3= test [
{-7-} "NotieneAmigos" ~: (cantidadDeAmigos redX usuario2) ~?= 0 ,
{-8-} "CasoNormalCantidadDeAmigos" ~: (cantidadDeAmigos redC usuario11) ~?= 3
 ]

--------------Test EJERCICIO 4
testsuite4= test[

{-9-} "DosUsuariosIgualCantMaxAmigos" ~: expectAny (usuarioConMasAmigos redA )  [usuario4,usuario2],
{-10-} "SoloUsuariosSinAmigos" ~: expectAny (usuarioConMasAmigos redSinRelacionesSinPublicaciones)  [usuario1, usuario2, usuario3, usuario4],
{-11-} "UnSoloUsuarioEnLaRed" ~: (usuarioConMasAmigos redConUnSoloUsuario) ~?= usuario1
 ]

------------Test EJERCICIO 5
testsuite5= test [
{-12-} "RobertoTiene11Amigos" ~:  (estaRobertoCarlos redRoberto ) ~?= True,
{-13-} "RobertoTieneMenosDe10Amigos" ~:  (estaRobertoCarlos redRoberto2 ) ~?= False,
{-14-} "RedVacia" ~:  (estaRobertoCarlos redVacia ) ~?= False
 ]

------------Test EJERCICIO 6
testsuite6= test[
{-15-} "redSinPublicaciones" ~: (publicacionesDe redSinPublicaciones usuario2) ~?= [],
{-16-} "NoPublicoNada" ~: (publicacionesDe redB usuario2) ~?= []
 ]

-----------Test EJERCICIO 7
testsuite7= test[
{-17-} "UnUsuarioQueLeGustenTodasLasPubl" ~: (publicacionesQueLeGustanA red7 usuario70) ~?= [publicacion70_1,publicacion71_1,publicacion72_1],
{-18-} "UnUsuarioQueNoLeGusteNingunaPubl" ~: (publicacionesQueLeGustanA red7 usuario71) ~?= [],
{-19-} "UsuarioQueLeGustanSoloSusPublicaciones" ~: (publicacionesQueLeGustanA red7 usuario73) ~?= publicacionesDe red7 usuario73
 ]

-----------Test EJERCICIO 8
testsuite8= test[
{-20-} "lesGustanLasmismasPublicaciones" ~:  (lesGustanLasMismasPublicaciones redTest8  usuario12 usuario13) ~?= True,
{-21-} "noLesGustanLasMismasPublicaciones" ~:  (lesGustanLasMismasPublicaciones redA usuario1 usuario2) ~?= False

 ]

-----------Test EJERCICIO 9
testsuite9= test[
{-22-} "Caso normal Seguidor fiel" ~: (tieneUnSeguidorFiel red9 usuario90) ~?= True,
{-23-} "Sin seguidor fiel" ~: (tieneUnSeguidorFiel red9 usuario93) ~?= False,
{-24-} "Red Sin publicaciones" ~: (tieneUnSeguidorFiel redSinPublicaciones usuario1) ~?= False,
{-25-} "Se autolikea todo (pero nadie más le dio like a todas)"  ~: (tieneUnSeguidorFiel red7 usuario73) ~?= False,
{-26-} "Se autolikea todo (pero alguien también le dio like a todas)" ~: (tieneUnSeguidorFiel red7B usuario73) ~?= True
 ]

testsuite10= test[
----------Test EJERCICIO 10
{-27-} "Alguno no tiene amigos" ~: (existeSecuenciaDeAmigos redX usuario2 usuario5) ~?= False,
{-28-} "Caso normal, existe secuencia" ~: (existeSecuenciaDeAmigos redSecuenciaDeAmigos usuario8 usuario13) ~?= True,
{-29-} "NoExisteSecuencia" ~: (existeSecuenciaDeAmigos redSecuenciaDeAmigos2 usuario8 usuario13) ~?= False,
{-30-} "Son amigos directamente" ~: (existeSecuenciaDeAmigos redB usuario1 usuario2) ~?= True,
{-31-} "Son el mismo usuario" ~: (existeSecuenciaDeAmigos redA usuario1 usuario1) ~?= False
 ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)
 

--TODOS LOS INPUTS PARA LOS TEST

usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Pedro")
usuario4 = (4, "Mariela")
usuario5 = (5, "Natalia")
usuario10 = (6, "fe")
usuario15 = (7, "esperanza")
usuario20 = (8, "Carlos")
usuario24 = (9, "Pablo")
usuario6 = (10, "Damian")
usuario7 = (11, "Esperanza")
usuario8 = (12, "C@rlos")
usuario9 = (13, "P@b(_0")
usuario11= (14, " ")
usuario12= (15, " 4")
usuario13= (16, " '")
usuario70 = (70, "Juan")
usuario71 = (71, "Roberto")
usuario72 = (72, "lucas")
usuario73 = (73, "Lautaro")
usuario90 = (90, "Juan")
usuario91 = (91, "Roberto")
usuario92 = (92, "lucas")
usuario93 = (93, "Lautaro")


relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario4, usuario1) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3 = (usuario3, usuario2)
relacion2_4 = (usuario2, usuario4)
relacion3_4 = (usuario4, usuario3)

publicacion1_1 = (usuario1, "Este es mi primer post", [usuario2, usuario4])
publicacion1_2 = (usuario1, "Este es mi segundo post", [usuario4])
publicacion1_3 = (usuario1, "Este es mi tercer post", [usuario2, usuario5])
publicacion1_4 = (usuario1, "Este es mi cuarto post", [])
publicacion1_5 = (usuario1, "Este es como mi quinto post", [usuario5])

publicacion2_1 = (usuario2, "Hello World", [usuario4])
publicacion2_2 = (usuario2, "Good Bye World", [usuario1, usuario4])

publicacion3_1 = (usuario3, "Lorem Ipsum", [])
publicacion3_2 = (usuario3, "dolor sit amet", [usuario2])
publicacion3_3 = (usuario3, "consectetur adipiscing elit", [usuario2, usuario5])

publicacion4_1 = (usuario4, "I am Alice. Not", [usuario1, usuario2])
publicacion4_2 = (usuario4, "I am Bob", [])
publicacion4_3 = (usuario4, "Just kidding, i am Mariela", [usuario1, usuario3])

publicacion5_1 = (usuario5, "kasodwidboiuasd", [usuario2])


--Nuevas relaciones:
relacion1_5 = (usuario1,usuario5)
relacion1_6 = (usuario1,usuario6)
relacion1_7 = (usuario1,usuario7)
relacion1_8 = (usuario1,usuario8)
relacion1_9 = (usuario1,usuario9)
relacion1_10 = (usuario1,usuario10)
relacion1_11 = (usuario1,usuario11)
relacion1_12 = (usuario1, usuario12)

relacion9_10 = (usuario9,usuario10)
relacion9_11 = (usuario9, usuario11)
relacion10_13 = (usuario10, usuario13)
relacion12_11= (usuario12, usuario11)
relacion13_11= (usuario13, usuario11)

relacion70_71 = (usuario70, usuario71)
relacion72_71 = (usuario72, usuario71)
relacion70_72 = (usuario70, usuario72)

relacion90_91 = (usuario90, usuario91)
relacion92_91 = (usuario92, usuario91)
relacion90_92 = (usuario90, usuario92)

relacion8_9= (usuario8, usuario9)
--relacion9_10 ya declarada
relacion10_11= (usuario10, usuario11)
relacion11_12= (usuario11, usuario12)
relacion12_13= (usuario12, usuario13)


--Nuevas publicaciones
publicacion8_1 = (usuario8, "Vamo boquitaaaaaa", [usuario10, usuario12,usuario9, usuario11])
publicacion8_2 = (usuario8, "Que ganas de tomar un fernet", [usuario12])
publicacion8_3 = (usuario8, "A quien le gusta TanBionica?", [usuario13, usuario12])

publicacion9_1 = (usuario9, "Basta de calentamiento global. #StopClimateChange", [usuario12, usuario13])
publicacion9_2 = (usuario9, "Sabias que cada vez que tiras una pajita al oceano una tortuga muere?", [usuario8])
publicacion9_3 = (usuario9, "Afiliate a Greenpeace", [usuario8, usuario11])
publicacion9_4 = (usuario9, "Aguante Greta Thunberg", [])

publicacion10_1 = (usuario10, "Wow", [usuario13, usuario12])
publicacion10_2 = (usuario10, "Vieron eso en el cielo?", [usuario13])

publicacion11_1 = (usuario11, "Prueba de sonido", [usuario12, usuario13])
publicacion11_2 = (usuario11, "No escuche nada", [usuario10])
publicacion11_3 = (usuario11, "Hasta Luego", [usuario12, usuario11])

publicacion12_1 = (usuario12, "Ojala se de", [usuario11, usuario13])
publicacion12_2 = (usuario12, "No entiendo como se usa esto todavia", [usuario11])
publicacion12_3 = (usuario12, "Este es mi año", [usuario9, usuario8])
publicacion12_4 = (usuario12, "Felices pascuas!", [])

publicacion13_1 = (usuario13, "Argentina 2023", [usuario10, usuario12])
publicacion13_2 = (usuario13, "Tengo 3 estrellas en el conjunto", [usuario11])

publicacion70_1 = (usuario70, "como me gustan las publicaciones, les voy a dar like a todas", [usuario70,usuario72])
publicacion71_1 = (usuario71, "no voy a dar ningun like.", [usuario70])
publicacion72_1 = (usuario72, "Hoy me levante contento, hoy me levante feliz", [usuario70])

publicacion73_1 = (usuario73, "Como le doy like a las publicaciones?", [usuario73])
publicacion73_2 = (usuario73, "voy a buscar en YT como hacerlo", [usuario73])
publicacion73_3 = (usuario73, "En YT no hay ningun tutorial ;(", [usuario73])

publicacion73_4 = (usuario73, "Como le doy like a las publicaciones?", [usuario73,usuario70])
publicacion73_5 = (usuario73, "voy a buscar en YT como hacerlo", [usuario73,usuario70])
publicacion73_6 = (usuario73, "En YT no hay ningun tutorial ;(", [usuario73,usuario70])

publicacion90_1 = (usuario90, "efwfwefwef", [usuario93])
publicacion91_1 = (usuario91, "ewfwefwefwef", [usuario92])
publicacion92_1 = (usuario92, "ssdwedewrfwe", [usuario91])

publicacion93_1 = (usuario93, "dsadsad", [])
publicacion93_2 = (usuario93, "vsdadso", [usuario90])
publicacion93_3 = (usuario93, "asasdsa", [usuario90])


usuariosA = [usuario1, usuario2, usuario3, usuario4]
relacionesA = [relacion1_2, relacion1_4, relacion2_3, relacion2_4, relacion3_4]
publicacionesA = [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1, publicacion3_2, publicacion4_1, publicacion4_2]
redA = (usuariosA, relacionesA, publicacionesA)

usuariosB = [usuario1, usuario2, usuario3, usuario5]
relacionesB = [relacion1_2, relacion2_3]
publicacionesB = [publicacion1_3, publicacion1_4, publicacion1_5, publicacion3_1, publicacion3_2, publicacion3_3]
redB = (usuariosB, relacionesB, publicacionesB)

usuariosC=[usuario8, usuario9, usuario10, usuario11, usuario12, usuario13]
relacionesC = [relacion9_10,relacion9_11,relacion10_13,relacion12_11,relacion13_11]
publicacionesC=[publicacion9_1,publicacion9_2,publicacion9_3,publicacion9_4,publicacion10_1,publicacion10_2,publicacion11_1,publicacion11_2,publicacion11_3,publicacion12_1,publicacion12_2,publicacion12_3,publicacion12_4,publicacion13_1,publicacion13_2]
redC= (usuariosC, relacionesC, publicacionesC)

--Para Test 1,2,3,10
usuariosX=[usuario2, usuario5]
relacionesX=[]
publicacionesX=[publicacion2_1, publicacion5_1]
redX=(usuariosX, relacionesX, publicacionesX)

--Para Test 1,5
usuariosVacios= []
publicacionesVacias=[]
relacionesVacias=[]
redVacia= (usuariosVacios, publicacionesVacias, relacionesVacias)

--Para Test 4
redSinRelacionesSinPublicaciones = (usuariosA, relacionesVacias, publicacionesVacias)

usuarioUnico=[usuario1]
redConUnSoloUsuario=(usuarioUnico,relacionesVacias, publicacionesVacias)

--Para Test 5
usuariosRoberto = [usuario1, usuario2, usuario3, usuario4, usuario5,usuario6,usuario7,usuario8,usuario9,usuario10,usuario11,usuario12]
relacionRoberto = [relacion1_2 ,relacion1_3 ,relacion1_4 ,relacion1_5 ,relacion1_6 ,relacion1_7 ,relacion1_8 ,relacion1_9 ,relacion1_10 ,relacion1_11, relacion1_12]
redRoberto= (usuariosRoberto,relacionRoberto,publicacionesVacias)

usuariosRoberto2 = [usuario1, usuario2, usuario3, usuario4, usuario5,usuario6,usuario7,usuario8,usuario9,usuario10,usuario11,usuario12]
relacionRoberto2 = [relacion1_2 ,relacion1_3 ,relacion1_4 ,relacion1_5 ,relacion1_6 ,relacion1_7 ,relacion1_8 ,relacion1_9 ,relacion1_10 ,relacion1_11 ]
redRoberto2= (usuariosRoberto2,relacionRoberto2,publicacionesVacias)

--Para Test 6
redSinPublicaciones= (usuariosA, relacionesA, relacionesVacias)

--Para Test 7,9
usuarios7 = [usuario70,usuario71,usuario72, usuario73]
relaciones7 =[relacion70_71,relacion72_71,relacion70_72] 
publicaciones7 =[publicacion70_1,publicacion71_1,publicacion72_1,publicacion73_1,publicacion73_2,publicacion73_3]
red7 =(usuarios7,relaciones7,publicaciones7)

--Para Test 8
publicacionTest8 =[publicacion10_1,publicacion9_1,publicacion11_1]
usuariosTest8 = [usuario10,usuario11,usuario12,usuario13]
redTest8 = (usuariosTest8 , relacionesVacias , publicacionTest8)

--Para Test 9
usuarios9 = [usuario90,usuario91,usuario92, usuario93]
relaciones9 =[relacion90_91,relacion92_91,relacion90_92] 
publicaciones9 =[publicacion90_1,publicacion91_1,publicacion92_1,publicacion93_1,publicacion93_2,publicacion93_3]
red9 =(usuarios9, relaciones9, publicaciones9)

publicaciones7B =[publicacion70_1,publicacion71_1,publicacion72_1,publicacion73_4,publicacion73_5,publicacion73_6]
red7B =(usuarios7,relaciones7,publicaciones7B)

--Para Test10
relacionesSecuencia= [relacion8_9,relacion9_10,relacion10_11,relacion11_12,relacion12_13]
redSecuenciaDeAmigos= (usuariosC,relacionesSecuencia,publicacionesVacias)

relacionesSecuencia2= [relacion8_9,relacion9_10,relacion11_12,relacion12_13]
redSecuenciaDeAmigos2= (usuariosC,relacionesSecuencia2,publicacionesVacias)