--import System.Win32 (fILE_FLAG_SEQUENTIAL_SCAN)
suma x y = x + y

esPar n | n == 0 = True
        | n == 1 = False 
        | otherwise = esPar(n-2)


--multiplosDe3 :: (Eq t, Num t) => t -> Bool
multiplosDe3 n | n == 1 = False
               | n == 0 = True 
               | n == 2 = False 
               |otherwise = multiplosDe3 (n - 3)


factorial n | n == 0 = 1
            | otherwise = n * factorial (n-1)

sumaDeImpares n | n == 1 = 1
                | otherwise = sumaDeImpares(n-1) + 2*n-1

parteEntera n | n < 1 = 0
              | otherwise = 1 + parteEntera(n - 1)

--SUMATORIA (Clase 4)
 
sumatoria :: Int -> Int
sumatoria 0 = 0
sumatoria n = sumatoria (n-1) + n

f1 :: Int -> Int 
f1 0 = 0
f1 n = 2^n + f1(n-1) 

f2 :: Int -> Float -> Float 
f2 0 q = 0
f2 n q = q^n + f2 (n-1) q
-- f2 3 4 = 4+4^2+4^3 n(natural) q(real)
 
f3 :: Int -> Float -> Float 
f3 0 q = 0 
f3 n q = (f3 (n-1) q) + q^(2*n-1) + q^(2*n)
-- OTRA FORMA 

f3' :: Int -> Float -> Float 
f3' n q = f2 (2*n) q

f3'' n = f2 (2 * n)


f4 :: Int -> Float -> Float
f4 0 q = 1
f4 n q = q^(2*n-1) + q^(2*n) - q^(n-1) + (f4 (n-1) q)
 
f4' :: Int -> Float -> Float 
f4' n q = (f3 n q) - (f2 (n-1) q)

eAprox :: Int -> Float
eAprox 0 = 1
eAprox n = (eAprox (n-1)) + 1 / (fromIntegral (factorial  n)) 
-- para transformar de entero a float usa fromIntegral

e :: Float 
e = eAprox 10

-- suma de (suma de (i^j))
fji :: Int -> Int -> Int
fji 0 m = 0

fji n m = (fji (n-1) m) + round ((f2 m (fromIntegral n)))
--            int                      float
-- round redondea  al entero
-- fji 3 5 = 1^1+1^2+1^3+1^4+1^5
--         + 2^1+2^2+2^3+2^4+2^5
--         + 3^1+3^2+3^3+3^4+3^5   

sumaPotencias :: Float -> Int -> Int-> Float 
sumaPotencias q n 0 = 0
sumaPotencias q n m = (sumaPotencias q n (m-1) + q^m*(f2 n q))

sumaRacionales :: Int -> Int -> Float 
sumaRacionales n 0 = 0
sumaRacionales n m = (sumaRacionales n (m-1)) + (fromIntegral (sumatoria n)) / (fromIntegral  m)

g1 :: Int -> Int -> Int
g1 0 n = 0
g1 i n = (g1 i (n-1)) + n^i + i^n

--o--

esDivisorDe :: Int -> Int -> Bool 
esDivisorDe x y = y `mod` x == 0 

sumaDivisoresH :: Int -> Int -> Int 
sumaDivisoresH n i | i == 1 = 1
                   | i `esDivisorDe` n = i + sumaDivisoresH n (i-1)
                   | otherwise = sumaDivisoresH n (i-1)
sumaDivisores :: Int -> Int
sumaDivisores n = sumaDivisoresH n n

buscaMenorDivisor :: Int -> Int -> Int 
buscaMenorDivisor n i| i == n = n -- recorre de i hasta n
                     | i `esDivisorDe` n = i -- busca el menor divisor de n
                     | otherwise = buscaMenorDivisor n (i+1) -- si i no es, analiza el  siguiente.


menorDivisor :: Int -> Int 
menorDivisor n = buscaMenorDivisor n 2

esPrimo  :: Int -> Bool
esPrimo n = buscaMenorDivisor n 2 == n

nEsimoPrimoPosicion :: Int -> Int -- posicion del primo  que le  das
nEsimoPrimoPosicion n | n == 2 = 1 --caso  base
                      | esPrimo n = 1 + nEsimoPrimoPosicion (n-1) -- le sumo  una posicion al  caso base del siguiente numero primo
                      | otherwise = nEsimoPrimoPosicion (n-1)

minimoPrimoDesde :: Int -> Int -- busca solo primos 
minimoPrimoDesde n | esPrimo n = n
                   | otherwise = minimoPrimoDesde (n + 1)-- con  esto  me da el siguiente primo (con +) el anterior (con -)
 --                                                                                        DESDE             HASTA
nEsimoPrimo :: Int -> Int  -- Devuelve el numero  de la posicion q le das 
nEsimoPrimo 1 = 2
nEsimoPrimo n = minimoPrimoDesde (1 + nEsimoPrimo (n-1))

--factorial n | n == 0 = 1
--            | otherwise = n * factorial (n-1)

menorFactDesde :: Int ->  Int 
menorFactDesde m  = menorFactApartirDesde 1 m 

menorFactApartirDesde :: Int-> Int -> Int 
menorFactApartirDesde i m | factorial i >= m = factorial i
                          | otherwise   = menorFactApartirDesde (i+1) m
menorFactHasta :: Int ->  Int 
menorFactHasta m  = menorFactApartirHasta 1 m 

menorFactApartirHasta :: Int-> Int -> Int 
menorFactApartirHasta i m | factorial i >= m = factorial (i-1)
                          | otherwise   = menorFactApartirHasta (i+1) m

fibPosicion :: Int -> Int 
fibPosicion n | n == 0 = 1
              | n == 1 = 1
              | otherwise = fibPosicion(n-1) + fibPosicion (n-2) 

--fib :: Int -> Int
--fib n | n == 0 = 1
  --    | 

--esFibonacci :: Int -> Bool 
--esFibonacci n = n == fib n 
division :: Integer -> Integer -> (Integer,Integer)
division a d | a<d = (0, a)
             | otherwise = (1 + k, r)
               where (k, r) = division(a-d) d

mcd :: Integer -> Integer -> Integer
mcd a b | abs b > abs a = mcd b a
mcd a 0 = abs a
mcd a b = mcd b (mod a b)

combinatorio :: Int -> Int -> Int
combinatorio n k = (factorial n) `div` ((factorial k)* factorial(n-k))

sumatoria2 :: [Int] -> Int
sumatoria2 ls | ls == [] = 0 
              | otherwise = head ls + sumatoria2 (tail ls)
          
longitud :: [Int] -> Int
longitud ls | ls == [] = 0
            |otherwise = 1 + longitud (tail ls)

pertenece ::  Int -> [Int] -> Bool
pertenece n ls | ls == [] = False
               | n == head ls = True
               | otherwise = pertenece n (tail ls)

sumatorials :: [Int] -> Int
sumatorials [] = 0
sumatorials (h:t) = h + sumatorials t

productoria :: [Int] -> Int
productoria [] = 1
productoria (h:t) = productoria t * h

sumarN :: Int -> [Int] -> [Int]
sumarN n ls = head ls +  n : sumarN n (tail ls)

--sumarPrimero :: [Int] -> [Int]
--sumarPrimero ls = sumarN (head ls) ls

sumarUltimo :: [Int] -> [Int]
sumarUltimo ls = sumarN (ultimoElemento ls) ls

ultimoElemento :: [Int] -> Int
ultimoElemento ls | ls == [] = 0
                  | longitud ls == 1 = head ls
                  | otherwise =  ultimoElemento (tail ls)


type Set a = [a]

agregar1 :: Int -> Set Int -> Set Int
agregar1 n ls | pertenece n ls = ls
             | otherwise = n : ls

incluido :: Set Int -> Set Int -> Bool
incluido [] _ = True
incluido ls lss = pertenece (head ls) lss && incluido (tail ls) lss

iguales :: Set Int -> Set Int -> Bool
iguales [] _ = True
iguales ls lss = incluido ls lss && incluido lss ls

agregarPartes :: Int -> Set (Set Int)  -> Set (Set Int)
agregarPartes n [] = []
agregarPartes n ls = agregar n (head ls) : agregarPartes n (tail ls)

{--union :: [Int] -> [Int] -> Set (Set Int)
union ls lss |--}
 
{--partes :: Int -> Set (Set Int)
partes 0 = [[]]
partes n = union (agregarPartes n (partes (n-1))) (partes (n-1))
--}                   

{--partes :: Int -> Set (Set Int)
partes n | n == 1 = 1
         | union (partes(n-1)) (agregarUno n (partes (n-1)))--}
--variaciones :: [Int] -> Int -> Set (Set Int)
--variaciones ls n | ls == [] = []
--                 | otherwise = (head ls) : (tail ls)
agregar :: Eq a =>  a -> Set a -> Set a
agregar n c | n `elem` c = c
            | otherwise = n:c

union :: Eq a => Set a -> Set a -> Set a
union [] ys     = ys
union (x:xs) ys = union xs (agregar x ys)
 

agregarElementoAdelante :: Int -> Set [Int] -> Set [Int]
agregarElementoAdelante x [] = []
agregarElementoAdelante x (ys:yss) = agregar (x:ys) (agregarElementoAdelante x yss)

agregarElementoAListas :: Set Int -> Set [Int] -> Set [Int]
agregarElementoAListas [] _ = []
agregarElementoAListas (x:xs) c = (agregarElementoAdelante x c) `union` (agregarElementoAListas xs c)

variaciones :: Set Int -> Int -> Set [Int]
variaciones c 0 = [[]]
variaciones c k = agregarElementoAListas c (variaciones c (k-1))

---0----
insertarEn :: [Int] -> Int -> Int -> [Int]
insertarEn xs n i | i == 1 = n:xs
                  | otherwise = (head xs) : (insertarEn (tail xs) n (i-1))

insertarEnCadaPosicion :: [Int] -> Int -> Int -> Set [Int]
insertarEnCadaPosicion xs c 1 = agregar (insertarEn xs c 1) []
insertarEnCadaPosicion xs c i = agregar (insertarEn xs c i) (insertarEnCadaPosicion xs c (i-1))

insertarEnCadaPosicionLs :: Set [Int] -> Int -> Set [Int]
insertarEnCadaPosicionLs [] c = []
insertarEnCadaPosicionLs (xs:xss) c = (insertarEnCadaPosicion xs c (longitud xs + 1)) `union` (insertarEnCadaPosicionLs xss c)


permutaciones :: Set Int -> Set [Int]
permutaciones []     = [[]]
permutaciones (c:cs) = insertarEnCadaPosicionLs (permutaciones cs) c

evaluar :: Polinomio -> Float -> Float
evaluar l n | ultimoElemento l == 1 = ultimoElemento l 
            | otherwise = head l * (n**grado l)+ (evaluar (head (tail l) *(n (grado l))))
