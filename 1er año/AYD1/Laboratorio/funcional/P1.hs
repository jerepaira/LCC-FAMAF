-- ejercicios 2
-- ejercicios 1a)
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Eta reduce" #-}

import Data.Binary (GBinaryGet (gget))
import Data.Text (commonPrefixes)
import GHC.IO.Device (IODevice (dup))
import GHC.TypeLits

{-# HLINT ignore "Use foldr" #-}
esCero :: Int -> Bool
esCero n = n == 0

-- ejercicios 1b)
esPositivo :: Int -> Bool
esPositivo n = n > 0

-- ejercicios 1c)
esVocal :: Char -> Bool
esVocal n | n == 'a' || n == 'e' || n == 'i' || n == 'o' || n == 'u' = True

-- ejercicios 1d)
valorAbsoluto :: Int -> Int
valorAbsoluto n
  | n >= 0 = n
  | n < 0 = -n

-- ejercicios 2a)
paraTodo :: [Bool] -> Bool
paraTodo [] = True
paraTodo (x : xs) = x && paraTodo xs

-- ejercicios 2b)
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs

-- ejercicios 2c)
productoria :: [Int] -> Int
productoria [] = 1
productoria (x : xs) = x * productoria xs

-- ejercicios 2d)
factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)

-- ejercicios 2e)
promedio :: [Int] -> Int
promedio [] = 0
promedio (x : xs) = sumatoria (x : xs) `div` length xs

-- ejercicios 3)

-- ejercicios 3a)
pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece n (x : xs)
  | x == n = True
  | otherwise = pertenece n xs

-- ejercicios 4)

-- ejercicios 4a)
paraTodo' :: [a] -> (a -> Bool) -> Bool
paraTodo' [] _ = True
paraTodo' (x : xs) f
  | f x = paraTodo' xs f
  | otherwise = False

--  en la funcion debo de usar id par aque me devuelva a id :: a -> a

-- ejercicios 4b)
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] _ = False
existe' (x : xs) f
  | f x = True
  | otherwise = existe' xs f

-- ejercicios 4c)
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] _ = 0
sumatoria' (x : xs) f = f x + sumatoria' xs f

-- ejercicios 4d)
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] _ = 1
productoria' (x : xs) f = f x * productoria' xs f

-- ejercicios 5)

-- ejercicios 5a)
paraTodo''' :: [a] -> (a -> Bool) -> Bool
paraTodo''' [] _ = True
paraTodo''' (x : xs) f = paraTodo' xs f

-- ejercicios 6)

-- ejercicios 6a)
todosPares :: [Int] -> Bool
todosPares [] = True
todosPares (x : xs) = paraTodo' xs even

-- ejercicios 6b)
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo _ [] = False
hayMultiplo n (x : xs) = existe' xs (\x -> x `mod` n == 0)

-- ejercicios 6c)
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [0 .. (n - 1)] (^ 2)

-- ejercicios 6d)
existeDivisor :: Int -> [Int] -> Bool
existeDivisor _ [] = False
existeDivisor n (x : ls) = existe' ls (\x -> n `mod` x == 0)

-- ejercicios 6e)
esPrimo :: Int -> Bool
esPrimo n = n > 1 && not (existeDivisor n [2 .. (n - 1)])

-- me falla cuando digo que n=4 idk

-- ejercicios 6f)
factorial' :: Int -> Int
factorial' n = productoria' [1 .. n] id

-- ejercicios 6g)
multiplicarPrimos :: [Int] -> Int
multiplicarPrimos xs = productoria' (filter esPrimo xs) id

-- si no se puede usar filter que la absorban

-- ejercicio 7
-- Filter: Podemos decir que filter  toma una lista y crea otra lista con los elementos que cumplen cierta condicion (o predicado)
-- Map: toma una lista de elementos a los cuales les aplica cierta funcion que los modifica.
-- ¿A que equivale la expresion map succ [1, -4, 6, 2, -8], donde succ n = n+1?
--  Lo que hace es aplicarle a cada elemento de la lista +1, se podria decir que devuelve el siguiente elemento
-- ¿Y la expresi´on filter esPositivo [1, -4, 6, 2, -8]?
-- filtra todos los elementos positivos de la lista, [1,6,2]

-- ejercicio 8

-- ejercicio 8a)
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x : xs) = 2 * x : duplica xs

-- ejercicio 8b)
duplica' :: [Int] -> [Int]
duplica' [] = []
duplica' (x : xs) = map (2 *) xs

-- ejercicio 9)

-- ejercicio 9a)
elementosPrimos :: [Int] -> [Int]
elementosPrimos [] = []
elementosPrimos (x : xs)
  | esPrimo x = x : elementosPrimos xs
  | otherwise = elementosPrimos xs

-- ejercicio 9b)
elementosPrimos' :: [Int] -> [Int]
elementosPrimos' [] = []
elementosPrimos' (x : xs) = filter esPrimo xs

-- ejercicio 9c)
multiplicarPrimos'' :: [Int] -> Int
multiplicarPrimos'' (x : xs) = productoria' (elementosPrimos' xs) id

-- ejercicio 10)

-- ejercicio 10a)
primIgualesA :: (Eq a) => a -> [a] -> [a]
primIgualesA _ [] = []
primIgualesA n (x : xs) | x == n = x : primIgualesA n xs

-- ejercicio 10b)
primIgualesA' :: (Eq a) => a -> [a] -> [a]
primIgualesA' _ [] = []
primIgualesA' n (x : xs) = takeWhile (== n) (x : xs)

-- ejercicio 11)

-- ejercicio 11a)
primIguales :: (Eq a) => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x : y : xs)
  | x == y = x : primIguales (y : xs)
  | otherwise = [x]

-- ejercicio 11b)
primIguales' :: (Eq a) => [a] -> [a]
primIguales' [] = []
primIguales' [x] = [x]
primIguales' (x : xs) = primIgualesA x xs

-- ejercicio 12
-- funcion general
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen _ z [] _ = z
cuantGen op z (x : xs) t = t x `op` cuantGen op z xs t

-- ejercicio 12a)
paraTodo'''' :: [a] -> (a -> Bool) -> Bool
paraTodo'''' xs t = cuantGen (&&) True xs t

-- ejercicio 12b)
existe'' :: [a] -> (a -> Bool) -> Bool
existe'' xs t = cuantGen (||) False xs t

-- ejercicio 12c)
sumatoria'' :: (Num b) => [a] -> (a -> b) -> b
sumatoria'' xs t = cuantGen (+) 0 xs t

-- ejercicio 12e)
productoria'' :: (Num b) => [a] -> (a -> b) -> b
productoria'' xs t = cuantGen (*) 1 xs t

-- ejercicio 13
distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion [] ys = length ys
distanciaEdicion xs [] = length xs
distanciaEdicion (x : xs) (y : ys)
  | x == y = distanciaEdicion xs ys
  | x /= y = 1 + distanciaEdicion xs ys

-- ejercicio 14

primQueCumplen :: (Eq a) => [a] -> (a -> Bool) -> [a]
primQueCumplen [] _ = []
primQueCumplen (x : xs) f = primIgualesA' x xs

-- ejercicio 15
-- echo a ojo

-- ejercicio 16

-- ejercicio 16a)
f :: (a, b) -> b
f (x, y) = y

-- ejercicio 16b)
-- f' :: (a, b) -> c
-- se puede?
-- no se nada sobre c

-- -- ejercicio 16c)
-- f'' :: (a -> b) -> a -> b
-- f'' t n =
-- ejercicio 6) del teorico
todos :: [Bool] -> Bool
todos [] = True
todos (x : xs) = x && todos xs

-- ejercicio 9a) del practico
todos' :: [a] -> (a -> Bool) -> Bool
todos' [] _ = True
todos' (x : xs) f = f x && todos' xs f

-- ejercicio 9b) del practico
existe''' :: [a] -> (a -> Bool) -> Bool
existe''' [] _ = False
existe''' (x : xs) f = f x || existe''' xs f

-- ejercicio 9c) del practico
sumatoria''' :: [a] -> (a -> Int) -> Int
sumatoria''' [] _ = 0
sumatoria''' (x : xs) f = f x + sumatoria''' xs f

-- ejercicio 9d) del practico
productoria''' :: [a] -> (a -> Int) -> Int
productoria''' [] _ = 1
productoria''' (x : xs) f = f x * productoria''' xs f

exp' :: Int -> Nat -> Int
exp' _ 0 = 1
exp' x n = x * exp' x (n - 1)

-- ejercicio 6b) practico 2
par :: Int -> Bool
par n
  | n `mod` 2 == 0 = True
  | otherwise = False

compara :: [Int] -> [Int] -> Bool
compara [] ys = True
compara xs [] = True
compara (x : xs) (y : ys) = x == y && compara xs ys

gg :: [Int] -> Int -> Int
gg [] _ = minBound
gg (x : xs) n = n `max` gg xs (n + 1)
