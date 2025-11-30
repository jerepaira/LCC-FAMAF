{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
import Data.ByteString (elemIndex)
-- Ejercicio 1

estaEnDNI :: Int -> Bool
estaEnDNI n  = n `elem` [0,1,2,3,4,9]

-- Ejercicio 2

cuentaNoDNI :: [Int] -> Int
cuentaNoDNI [] = 0
cuentaNoDNI (x:xs) | estaEnDNI x = 0 + cuentaNoDNI xs
                    | otherwise = 1 + cuentaNoDNI xs


-- Ejercicio 3

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

estaEnDNI' :: Int -> Int
estaEnDNI' n | estaEnDNI n  = 0 
             | otherwise = 1

cuantaNoDNI' :: [Int] -> Int
cuantaNoDNI' [] = 0
cuantaNoDNI' (x:xs) = sumatoria (map estaEnDNI' xs)
 
-- Ejercicio 4

aplicanSegun :: [Int] -> Int -> (Int -> a) ->  (Int -> a) -> [a]
aplicanSegun [] _ _ _ = []
aplicanSegun (x:xs) n f g  | x>= n = f x : aplicanSegun xs n f g
                            | otherwise = g x : aplicanSegun xs n f g

