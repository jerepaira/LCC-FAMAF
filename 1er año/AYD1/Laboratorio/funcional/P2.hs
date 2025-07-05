{-# LANGUAGE NPlusKPatterns #-}
import GHC.TypeLits

-- cada valor del tipo Carrera es un constructor
-- ejercicio 2a)
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving Eq

-- ejercicio 2b)
titulo :: Carrera -> String
titulo Matematica = "LMA" 
titulo Fisica = "LF" 
titulo Computacion = "LCC" 
titulo Astronomia = "LA" 

-- ejercicio 2c)
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Bounded,Ord,Eq)

-- ejercicio 2d)
cifradoAmericano ::  NotaBasica -> Char 
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol ='G' 
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- ejercicio 3)

-- ejercicio 3a)
-- (no se si es necesario poner la restriccion de tipo Num, aunque, hace  sentido para otros tipos de datos??)
minimoElemento :: Ord a =>  [a] -> a 
minimoElemento [x] = x 
minimoElemento (x:y:xs) = minimoElemento ((x `min`y):xs) 

-- ejercicio 3b)
minimoElemento' :: (Ord a,Bounded a)  =>  [a] -> a 
minimoElemento' [] = minBound
minimoElemento'(x:y:xs) =  minimoElemento' ((x `min`y):xs) 

-- ejercicio 3c)
notaGrave :: [NotaBasica] -> NotaBasica
notaGrave  = minimoElemento 

-- -- ejercicio 4)

-- -- ejercicio 4a)
type Altura = Int 
type  NumCamiseta = Int
type ManoHabil = PiernaHabil 
data Zona = Arco | Defensa | Mediocampo | Delantero   deriving (Show, Eq) 
data TipoReves = DosManos | UnaMano  deriving (Show, Eq)
data Modalidad = Carrera | Pista | Monte | BMX  deriving (Show, Eq)
data PiernaHabil = Izquierda | Derecha  deriving (Show, Eq)
data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura  deriving (Show, Eq)

-- -- ejercicio 4b)
-- Ciclista :: Modalidad -> Deportista

-- -- ejercicio 4c)
contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas (x:xs) | esVelocista x = 1 + contarVelocistas xs
                        | otherwise = contarVelocistas xs
                        where 
                            esVelocista (Velocista _ ) = True
                            esVelocista _ = False 

-- -- ejercicio 4d)
contarFutbolistas :: [Deportista] -> Zona -> Int
contarFutbolistas [] _ = 0
contarFutbolistas (Futbolista z _ _ _:xs) zone =compararZona z zone + contarFutbolistas xs zone
contarFutbolistas (_ : xs) zone = contarFutbolistas xs zone

compararZona :: Zona -> Zona -> Int
compararZona Arco Arco = 1
compararZona Defensa Defensa = 1
compararZona Mediocampo Mediocampo = 1
compararZona Delantero Delantero = 1
compararZona _ _  = 0

-- definicion de compararZona (asumo que es como una modularizacion del problema, lo que se define un sinonimo)
-- ejercicio 4e)
contarFutbolistas' :: [Deportista] -> Zona -> Int
contarFutbolistas' xs zone = length (filter (futbolistaZona zone) xs)
    where 
        futbolistaZona :: Zona -> Deportista -> Bool
        futbolistaZona z (Futbolista zona _ _ _) = z == zona
        futbolistaZona _ _ = False
    
-- ejercicio 5)

-- ejercicio 5a)
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

-- ejercicio 5b)
data Alteracion = Bemol | Natural | Sostenido

-- ejercicio 5c),5e)
data NotaMusical = Nota NotaBasica Alteracion 

-- ejercicio 5d)
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nota alteracion)  =  case alteracion  of
                                    Sostenido -> sonidoNatural nota + 1
                                    Bemol -> sonidoNatural nota - 1
                                    Natural -> sonidoNatural nota

-- ejercicio 5f) (no se que me esta pidiendo hacer)

-- ejercicio 6

-- ejercicio 6a)
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- ejercicio 7

-- ejercicio 7a)
data Cola = VaciaC | Encolada Deportista Cola
-- 1)
atender :: Cola -> Maybe Cola 
atender VaciaC = Nothing 
atender (Encolada _ cola) =  Just cola

-- 2)
encolar :: Deportista -> Cola -> Cola
encolar d (Encolada d1 cola) = Encolada d1 (encolar d cola)


--3)

mismazona :: Zona -> Zona -> Bool
mismazona Arco Arco = True
mismazona Defensa Defensa = True    
mismazona Mediocampo Mediocampo = True
mismazona  Delantero Delantero = True
mismazona  _ _ = False


busca :: Cola -> Zona -> Maybe Deportista 
busca VaciaC _ = Nothing
busca (Encolada (Futbolista z1 a b c ) cola) zona | mismazona z1 zona = Just (Futbolista z1 a b c )
                                             |otherwise = busca cola zona

busca (Encolada d cola) zona =  busca cola zona


-- ejercicio 8

-- a) dado type guiaTelefonica = ListaAsoc String String; como la clave: Nombre de la persona, valor: el numero de la persona, definico con String el numero ya  que un numero puede contener prefijos y algun simbolo como (+ , -,etc)

-- b)

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) 

-- b1)
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo _ _  a1) = 1 + la_long a1

-- b2)
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat xs Vacia = xs 
la_concat Vacia ys = ys
la_concat (Nodo a b  a1) ys  = Nodo a b (la_concat a1 ys) 

-- b3)

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar  Vacia  clave valor = Nodo clave valor Vacia
la_agregar (Nodo k v resto) clave valor  | clave == k  = Nodo clave valor resto
                                         | otherwise = Nodo k v (la_agregar resto clave valor)

-- b4)
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia  = []
la_pares (Nodo k v resto) = (k,v) : la_pares resto


-- b5)
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo k v resto) k1 | k == k1 = Just v
                             | otherwise = la_busca resto k1 


-- b6)
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar clave (Nodo k v resto) | clave == k = resto
                                 |otherwise = Nodo k v (la_borrar clave resto)


-- ejercicio 9)

data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a )

-- a) 
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama izq _ der) =  1 + a_long izq + a_long der


-- b)
-- a_hojas :: Arbol a -> Int









-- 





























smin :: [Int] -> Int
smin [] = 0
smin (x:xs) = 0 `min` (smin xs + x)



min':: [Int] -> Int
min' [] = 0
min' (x:xs) = smin (x:xs) `min` min' xs

pin8:: [Int] -> Bool
pin8 [] = False
pin8 (x:xs) =  gpin8 x xs


gpin8 :: Int -> [Int] -> Bool
gpin8 n [] = n==8
gpin8 n (x:xs) = n==8 || gpin8 (x*n) xs


f ::  [Int] -> Int
f [] = 0
f (x:xs) = 1 + gmf x xs + f xs

gmf :: Int-> [Int] -> Int 
gmf n [] = 1
gmf n (x:xs) = 1 + gmf (n+x) xs


iguales :: (Eq a) => [a] -> Bool
iguales [] = True
iguales [x] = True
iguales (x:y:xs) = (x==y) && iguales (y:xs)

minimo' :: [Int] -> Int
minimo' [x] = x
minimo' (x:y:xs) = x `min` minimo' (y:xs)

creciente :: [Int] -> Bool
creciente [] = True
creciente [x] = True
creciente (x:y:xs) = x<=y && creciente (y:xs)

prod :: [Int] -> [Int] -> Int
prod [] ys = 0
prod xs [] = 0
prod (x:xs) (y:ys) = x*y + prod xs ys

gsum :: Int -> [Int] -> Bool
gsum n [] = n>=0
gsum n (x:xs) = n>=0 && gsum (n+x) xs



-- 
iga :: Int -> [Int] -> Bool
iga _ [] = True
iga n (x:xs) = x==n && iga n xs

maxiga :: Int -> [Int] -> Int
maxiga e [] = 0
maxiga e (x:xs) = (0 `max` (mmaxiga e xs + 1)) `max` maxiga e xs

mmaxiga :: Int -> [Int] -> Int
mmaxiga e [] = 0
mmaxiga e (x:xs) = 0 `max` (mmaxiga e xs + 1)

gf :: [Int] -> Int -> Int
gf [] m = 0
gf (x:xs) m = (m+1)*x + gf xs (m+1)

f' :: [Int] -> Int
f' [] = 0
f' (x:xs) = x +  gf xs 0



gcuad :: Nat -> Nat -> Bool
gcuad 1 m = m==0
gcuad (n+1) m = n*n + n == m || gcuad n (m+1)

gn8 :: [Int] -> Int -> Int
gn8 [] _ = 1
gn8 (x:xs) n | n==8 = 1 + gn8 xs (n+x)
             | otherwise = gn8 xs (n+x)



f'' :: [Int] -> [Int] -> Int
f'' [] ys = minBound
f'' xs [] = minBound
f'' (x:xs) (y:ys) = (x-y) `min` f'' xs ys

factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial (n+1) = (n+1)*factorial n

h :: Int -> Int -> Bool
h 0 m = False
h (n+1) m = n+1+m == factorial n || h n (m+1)

-- 
prod' :: [Int] -> Int
prod' [] = 1
prod' (x:xs) =  x*prod' xs

h' :: [Int] -> Int -> Bool
h' [] m = m<1
h' (x:xs) m = m<prod' xs || h' xs (m*x)

