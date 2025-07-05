import System.Console.Terminfo (restoreDefaultColors)
{-
Parcial 1 2024-04-22 (Tema C)
-}

-- Ejercicio 1 

-- Ejercicio 1)a)

data PiedrasPreciosas = Diamante Color Dureza Peso Precio | Esmeralda Dureza Peso Precio | Rubi ColorRubi Precio | Zafiro Color Precio deriving Show

-- Tipos enumerados 

data Color = Azul | Rosa | Amarillo | Gris | Blanco  deriving Show
data Dureza = MuyDura | Dura | Fragil  deriving Show
data ColorRubi = Sangre | Carmesi  deriving Show

-- Sinonimos de Tipo

type Peso = Int
type Precio = Int

-- Ejercicio 1)b)

-- Funcion Auxiliar

igualColor :: Color -> Color -> Bool
igualColor Azul Azul = True
igualColor Rosa Rosa = True
igualColor Amarillo Amarillo = True
igualColor Gris Gris = True
igualColor Blanco Blanco = True
igualColor _ _ = False

-- 

cuantosDiamantes :: [PiedrasPreciosas] -> Color -> Int
cuantosDiamantes [] _ = 0
cuantosDiamantes (Diamante c1 d1 peso1 p1:lm) x | igualColor c1 x = 1 + cuantosDiamantes lm x
                                                | otherwise = cuantosDiamantes lm x
cuantosDiamantes (_:lm) x = cuantosDiamantes lm x

-- Ejemplo

{-
ghci> cuantosDiamantes [Diamante Azul MuyDura 100 5000] Azul
1
ghci>-} 

-- Ejercicio 1)c)

-- Funciones Auxiliares 

igualDureza :: Dureza -> Dureza -> Bool
igualDureza MuyDura MuyDura = True
igualDureza Dura Dura = True
igualDureza Fragil Fragil = True
igualDureza _ _ = False

-- 

igualPiedras :: PiedrasPreciosas -> PiedrasPreciosas -> Bool
igualPiedras (Diamante c1 d1 peso1 p1) (Diamante c2 d2 peso2 p2) = p1 == p2 && peso1 == peso2 
igualPiedras (Esmeralda d1 peso1 p1) (Esmeralda d2 peso2 p2) = igualDureza d1 d2 && p1 == p2
igualPiedras (Rubi c1 p1) (Rubi c2 p2) = p1 == p2
igualPiedras (Zafiro c1 p1) (Zafiro c2 p2) = igualColor c1 c2  && p1 == p2
igualPiedras _ _ = False


-- Ejercicio 1)d)




hayDosDistintas :: [PiedrasPreciosas] -> Bool
hayDosDistintas [] = False
hayDosDistintas [_] = False
hayDosDistintas (x:y:lm) |  not (igualPiedras x y) = True
                        | otherwise = hayDosDistintas (y:lm) 

-- Ejemplo 
{-
ghci> hayDosDistintas [Diamante Azul MuyDura 100 5000, Esmeralda MuyDura 100 5000]
True
ghci> hayDosDistintas [Diamante Azul MuyDura 100 5000, Diamante Azul  MuyDura 100 5000]
False
-}


-- Ejercicio 2

-- Ejercicio 2)a)

data EstadoMascotas = EvolucionDeMascotas String Raza Int Int Int EstadoMascotas | NoHayMascotas

-- Tipos numerados

data Raza = Pastor | Labrador | Golden | Siberiano | Otro 

-- Funcion auxilar 

igualRaza :: Raza -> Bool
igualRaza Pastor = True
igualRaza Labrador = True
igualRaza Golden = True
igualRaza Siberiano = True
igualRaza Otro = True


obtenerAlta :: Raza -> Int -> Int -> Int -> Bool
obtenerAlta Golden a1 a2 a3  =  (a1>7||a2>7||a3>7) && (a1>6&&a2>6&&a3>6)
obtenerAlta Siberiano a1 a2 a3  =  (a1>7||a2>7||a3>7) && (a1>6&&a2>6&&a3>6)
obtenerAlta Pastor a1 a2 a3 = a1>7 && a2>7 && a3>7
obtenerAlta Labrador a1 a2 a3 = a1>8 && a2>8 && a3>8
obtenerAlta Otro a1 a2 a3 =  a1>8 && a2>8 && a3>8

-- Ejercicio 2)b)

seVaALaCasa :: EstadoMascotas -> String -> Bool
seVaALaCasa NoHayMascotas _  = False
seVaALaCasa (EvolucionDeMascotas nombre1 raza a1 a2 a3 resto) nombre2 | nombre1 == nombre2 && obtenerAlta raza a1 a2 a3  = True
                                                                        | otherwise = seVaALaCasa resto nombre2

-- Ejercicio 2)c)

-- Funcion Auxiliar 

maxEstado :: Int -> Int -> Int -> Int
maxEstado a b c = (a`max`b) `max` c 
-- 

devolverMejorEstado :: EstadoMascotas -> String -> Maybe Int
devolverMejorEstado NoHayMascotas _ = Nothing
devolverMejorEstado (EvolucionDeMascotas nombre1 raza a1 a2 a3 resto) nombre2 | nombre1 == nombre2 = Just (maxEstado a1 a2 a3)
                                                                                | otherwise = devolverMejorEstado resto nombre2