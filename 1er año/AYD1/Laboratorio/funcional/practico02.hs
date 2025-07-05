{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
import Numeric.Natural
import Data.Time (TimeZone(timeZoneName))
import Distribution.FieldGrammar (SpecVersion)

-- Labotorio 1
-- 1)a)
sum_cuad:: [Int] -> Int
sum_cuad [] = 0
sum_cuad (x:xs) = x*x + sum_cuad xs

-- 1)b)
iga:: Eq a => a -> [a] -> Bool
iga _ [] = True
iga e (x:xs) = (e==x) && iga e xs

-- 1)c)
exp' :: Int -> Natural -> Int
exp' _ 0 = 1
exp' x n = x * exp' x (n-1)

-- 1)d)
sum_par:: Int -> Int
sum_par 0 = 0
sum_par n   | (n+1) `mod` 2 == 0  = (n+1) + sum_par (n-1)
            | otherwise = sum_par (n-1)


-- Laboratorio 2,3

data Carrera = Matematica | Fisica | Computacion | Astronomia  deriving Eq

titulo :: Carrera -> String

titulo Matematica = "lic. matematica"
titulo Fisica = "lic. Fisica"
titulo Computacion = "lic. Computacion"
titulo Astronomia = "lic. Astronomia"

-- 1)c)

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si  deriving (Eq,Ord,Show)

cifradoAmericano :: NotaBasica -> Char

cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'


-- Laboratorio 4
--4)a)
minimoElemento:: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:y:xs) = x `min` minimoElemento (y:xs)

-- 4)b)
minimoElemento':: (Ord a,Bounded a) => [a] -> a
minimoElemento' [] = minBound
minimoElemento' [x] = x
minimoElemento' (x:y:xs) = x `min` minimoElemento' (y:xs)

-- Laboratorio 5
-- 5-a)
--Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int
-- Tipos algebr´aicos sin par´ametros (aka enumerados)
data Zona = Arco | Defensa | Mediocampo | Delantero deriving (Show, Eq)
data TipoReves = DosManos | UnaMano deriving (Show)
data Modalidad = Carretera | Pista | Monte | BMX  deriving (Show)
data PiernaHabil = Izquierda | Derecha deriving (Show)
-- Sinonimo
type ManoHabil = PiernaHabil
-- Deportista es un tipo algebraico con constructores param´etricos
data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving Show

--5)b) Ciclista :: Modalidad -> Deportista

-- 5)c) 
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (Velocista _:xs) = 1 + contar_velocistas xs
contar_velocistas (_:xs) = contar_velocistas xs

-- 5)d)

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas ( Futbolista Arco _ _ _:xs) Arco = 1 + contar_futbolistas xs Arco
contar_futbolistas ( Futbolista Defensa _ _ _:xs) Defensa =  1 + contar_futbolistas xs Defensa
contar_futbolistas ( Futbolista Mediocampo _ _ _:xs) Mediocampo = 1 + contar_futbolistas xs  Mediocampo 
contar_futbolistas ( Futbolista Delantero _ _ _:xs) Delantero = 1 + contar_futbolistas xs  Delantero
contar_futbolistas (_:xs) zona = contar_futbolistas xs zona 

-- 5)e)
-- contar_futbolistas' :: [Deportista] -> Zona -> Int
-- contar_futbolistas' xs zona = length (filter esDeZona xs)
--                         where esDeZona (Futbolista z _ _ _ )= z == zona
--                         esDeZona _= False


-- Laboratorio 6

-- 6)a)
f''':: Int -> Natural -> Int
f''' _ 0 = 0
f''' x n = 1 + f''' x (n-1) * x

-- 6)b)
-- pi':: Int -> Int
-- pi' 0 = 0
-- pi' n = pi' (n-1) + 4*((exp'(-1) (n-1))`div`((2*(n-1)+1)))

-- -- 6)c)
-- g:: Int -> Int
-- g 0 = 0
-- g x = (x-1)*(x-1) +2*(x-1) + 1

-- gf :: Natural -> Natural
-- gf 0 = 0
-- gf = gf ()


-- 6)d)

f'':: [Int] -> Bool
f'' [] = False
f'' (x:xs) = prodf'' xs == x || f'' xs

prodf'':: [Int] -> Int
prodf'' [] = 1
prodf'' (x:xs) = x*prodf'' xs


-- Laboratorio 7

-- 7)a)
iguales::(Eq a) => [a] -> Bool 
iguales [] = True
iguales [_] = True
iguales (x:y:xs) = (x==y) && iguales (y:xs)

--7)b)
minimo:: [Int] -> Int
minimo  [] = minBound
minimo [x] = x
minimo (x:y:xs) = x `min` minimo (y:xs)

--7)c)
creciente:: [Int] -> Bool
creciente [] = True
creciente [_]  = True
creciente (x:y:xs) = x<=y && creciente (y:xs)

--7)d)

prod:: [Int] -> [Int] -> Int
prod [] _ = 0
prod _ [] = 0
prod (x:xs) (y:ys) = (x*y) + prod xs ys

-- Laboratorio 8

--8)a)
gsum:: Int -> [Int] -> Bool
gsum n [] = n>=0
gsum n (x:xs) = n>=0 && gsum (n+x) xs

--8)b)
gsumAnt :: Int -> [Int] -> Bool
gsumAnt _ [] = False
gsumAnt n (x:xs) = x==n || gsum(n+x) xs


--8)c)
gsum8 :: Int-> [Int] -> Bool
gsum8 _ [] = False
gsum8 n (x:xs) = n==8 && gsum8 (n+x) xs

--8)d)
gf :: Int -> [Int] -> Bool
gf _ [] = True
gf n (x:xs) = (n == x+sum xs ) `max` gf (n+x) xs

-- Laboratorio 9

-- 9)a)
gcuad:: Int -> Int ->Bool
gcuad 0 m = 0==m
gcuad n m = n*n + n ==m || gcuad (n+1) m

-- 9)b)
-- gn8:: (Num a,Eq a)=>a -> [a] -> Bool
-- gn8 n [] |n == 8 = 1
--         | n/= 8 = 0

-- gn8 n (x:xs) | n==8 = 1+ gn8 (n+x) xs
--             |otherwise = gn8 (n+x) xs


-- Laboratorio 10
sonidoNatural:: NotaBasica -> Int
sonidoNatural Do=0
sonidoNatural Re=2
sonidoNatural Mi=4
sonidoNatural Fa=5
sonidoNatural Sol=7
sonidoNatural La=9
sonidoNatural Si=11

data Altereacion = Bemol | Natural | Sostenido deriving (Eq,Show)
data NotaMusical = Nota NotaBasica Altereacion deriving (Eq,Show)

sonidoCromatico:: NotaMusical -> Int 
sonidoCromatico  (Nota n Natural) = sonidoNatural n
sonidoCromatico  (Nota n Bemol) = sonidoNatural n - 1
sonidoCromatico  (Nota n Sostenido) = sonidoNatural n + 1
-- me falta el ultimo

-- Laboratorio 11
-- 11)a)
primerElemento:: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:_) = Just x

-- Laboratorio 12
data Cola = VaciaC | Encolada Deportista Cola
-- 12)a)
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ c) = Just c

--12)b)
encolar :: Deportista -> Cola -> Cola
encolar dep VaciaC = Encolada dep VaciaC
encolar dep (Encolada dep' c) = Encolada dep' (encolar dep c)
-- 12)c)
busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC _ = Nothing
busca (Encolada (Futbolista z' nc ph a) c) z
  | z == z' = Just (Futbolista z' nc ph a)
  | otherwise = busca c z
busca (Encolada _ c) z = busca c z

-- 2

data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b )
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo _ _ xs) = 1 + la_long xs

-- b
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia ys = ys
la_concat (Nodo x y xs) ys = Nodo x y (la_concat xs ys)

-- c
la_agregar :: (Eq a) => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia x y = Nodo x y Vacia
la_agregar (Nodo x y xs) x' y'
  | x == x' = Nodo x y' xs
  | otherwise = Nodo x y (la_agregar xs x' y')

-- d
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo x y xs) = (x, y) : la_pares xs

-- e
la_busca :: (Eq a) => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo x y xs) x'
  | x == x' = Just y
  | otherwise = la_busca xs x'

-- f
la_borrar :: (Eq a) => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar x (Nodo x' y xs)
  | x == x' = xs
  | otherwise = Nodo x' y (la_borrar x xs)
