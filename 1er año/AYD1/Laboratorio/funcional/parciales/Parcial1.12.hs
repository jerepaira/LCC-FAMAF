
--  TEMA D

-- Ejercicio 1

-- Tipo enumerado
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Redundant bracket" #-}

data Deporte = Futbol | Basquet | Natacion | Tenis | Boxeo deriving Show


-- Sinonimo de tipo
type Nombre = String
type DNI = Int
type Padron = [Socio]
type Deuda = Int

-- 
data Socio = Socio Nombre DNI [Deporte] Deuda deriving Show


-- 1)

-- Funciones auxiliares 
igual_deporte :: Deporte -> Deporte -> Bool
igual_deporte Futbol  Futbol  = True
igual_deporte Basquet  Basquet  = True
igual_deporte Natacion  Natacion  = True
igual_deporte Tenis  Tenis  = True
igual_deporte Boxeo  Boxeo  = True
igual_deporte _ _   = False

esta_inscripto_en :: Socio -> Deporte -> Bool
esta_inscripto_en (Socio _ _ [] _ ) _ = False
esta_inscripto_en (Socio nombre  dni (x:xs) deuda ) deporte =  igual_deporte x deporte || esta_inscripto_en (Socio nombre dni xs deuda ) deporte

-- Ejemplo 

{-
ghci> esta_inscripto_en (Socio "Juan" 123 [Futbol, Tenis] 100) Boxeo
False
ghci> esta_inscripto_en (Socio "Juan" 123 [Futbol, Tenis] 100) Futbol
True
-} 


-- 2)

-- Funciones auxiliares 

esta_en_lista :: Deporte -> [Deporte] -> Bool
esta_en_lista _ [] = False
esta_en_lista  deporte (x:xs) | igual_deporte deporte x = True
                                | otherwise = esta_en_lista deporte xs

agregar_deporte :: Deporte -> Socio -> Socio
agregar_deporte deporte1 (Socio nombre dni deportes deuda) | esta_en_lista deporte1 deportes = (Socio nombre dni deportes deuda)
                                                            | otherwise = (Socio nombre dni (deporte1:deportes) deuda)  

-- Ejemplo 

{-
Ok, one module loaded.
ghci> agregar_deporte Natacion   (Socio "Lucia" 456 [Tenis] 100)
Socio "Lucia" 456 [Natacion,Tenis] 100
-}


-- 3)

cuantos_practican :: Padron -> Deporte -> Int
cuantos_practican [] _ = 0
cuantos_practican (d:resto) deporte | esta_inscripto_en d deporte  = 1 + cuantos_practican  resto deporte
                                                        | otherwise = cuantos_practican resto deporte

-- Ejercicio 2

type Monto = Int
data RegistroCobros = Cobro DNI Monto  RegistroCobros | HistorialVacio


deuda_total :: RegistroCobros -> DNI -> Int
deuda_total HistorialVacio  _  = 0
deuda_total (Cobro dni cantidad resto) dni1 | dni == dni1  = cantidad + deuda_total resto dni1
                                            | otherwise = deuda_total resto dni1




-- Ejercicio 3

socios_deudores :: Padron -> Int -> [Nombre]
socios_deudores []  _ = []
socios_deudores ((Socio nombre _ _ deuda): resto) monto | deuda >= monto = nombre : socios_deudores resto monto
                                                        | otherwise = socios_deudores resto monto