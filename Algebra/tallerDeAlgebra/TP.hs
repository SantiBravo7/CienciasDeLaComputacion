type Polinomio = [Float]
type Monomio = (Float, Int)

crearPolinomio :: [Float] -> Polinomio --1))
crearPolinomio l | head l /= 0 = l
                 | tail l == [] = [] 
                 |otherwise = crearPolinomio (tail l)

grado :: Polinomio -> Int --2)
grado l = longitud l - 1 

longitud :: [Float] -> Int
longitud l | l == [] = 0
           | otherwise = longitud (tail l) + 1

               
evaluar :: Polinomio -> Float -> Float --3)
evaluar [] _ = 0
evaluar l n =  head l * (n^grado l) + (evaluar (tail l) n)
        
productoPorMonomio :: Monomio -> Polinomio -> Polinomio --4)
productoPorMonomio (m,n) p |p == [] = []
                           |otherwise = union (multiplicacionPorNumero m p) (añadirCeros n)
                           

multiplicacionPorNumero :: Float -> Polinomio -> Polinomio
multiplicacionPorNumero a [] = []
multiplicacionPorNumero a ls | a == 0 = []
                             | otherwise = a * head ls : multiplicacionPorNumero a (tail ls)

añadirCeros :: Int -> [Float] 
añadirCeros 0 = []
añadirCeros a = 0 : añadirCeros (a-1)

union :: Polinomio -> [Float] -> Polinomio
union [] ys = ys
union ls ys = head ls : (union (tail ls) ys)

agregar :: Float -> Polinomio -> Polinomio
agregar x c =  x:c

productoPorPolinomio :: Polinomio -> Polinomio -> Polinomio --5)
productoPorPolinomio p q | p == [] || q == [] = []
                         | otherwise = head p * head q : sumarPolinomiosMismoGrado (productoPorPolinomio ([head p]) (tail q)) (productoPorPolinomio (tail p) q)

sumarPolinomiosMismoGrado :: Polinomio -> Polinomio -> Polinomio
sumarPolinomiosMismoGrado [] q = q
sumarPolinomiosMismoGrado p [] = p
sumarPolinomiosMismoGrado p q = (head p + head q) : sumarPolinomiosMismoGrado (tail p) (tail q)
sumar :: Float -> Float -> Float
sumar a b = a + b

evaluacionmultiple :: [Float] -> Polinomio -> Polinomio -> [Float] --6)
evaluacionmultiple [] p q = []
evaluacionmultiple ls p q | mod (longitud ls) 2== 0 = evaluar p (head ls) : evaluacionmultiple (tail ls) p q
                          | otherwise = evaluar q (head ls) : evaluacionmultiple (tail ls) p q

raices :: [(Float,Int)] -> Polinomio
raices [] = []
raices ls | longitud2 ls == 1 = deTuplaAPolinomio (head ls) ++ []
                      | otherwise = productoPorPolinomio (raices (tail ls)) (deTuplaAPolinomio (head ls))

deTuplaAPolinomio :: (Float,Int) -> Polinomio
deTuplaAPolinomio (0,0) = []
deTuplaAPolinomio (r,n) | n == 1 = [1,-r]  
                        | otherwise = aux (-r,n)   
                                      
aux :: (Float,Int) -> Polinomio
aux (r,n) | n == 2 = productoPorPolinomio [1,r] [1,r]
          | otherwise = productoPorPolinomio [1,r] (aux (r,n-1))

longitud2 :: [(Float,Int)] -> Int 
longitud2 l | l == [] = 0
            | otherwise = longitud2 (tail l) + 1

interpolacion :: [Float] -> Float -> Polinomio 
interpolacion [] y = [y] 
interpolacion ls y | y == 0 = raices (aux3 ls) ++ []
                   | otherwise = sumarAlTerminoIndependiete  (raices (aux3 ls)) y
                        
terminoIndependiente :: [Float] -> Float
terminoIndependiente ls | ls == [] = 0
                        | longitud ls == 1 = head ls
                        | otherwise =  terminoIndependiente (tail ls)
                    

sumarAlTerminoIndependiete :: Polinomio -> Float -> Polinomio
sumarAlTerminoIndependiete ls a | longitud ls == 1 = [head ls + a] ++ []
                                | otherwise = [head ls] ++ sumarAlTerminoIndependiete (tail ls) a

aux3 :: [Float] -> [(Float, Int)]
aux3 (x:xs) | longitud (x:xs) == 1 = [(x,1)] ++ []
            | otherwise = aux3 [x] ++ aux3 xs
