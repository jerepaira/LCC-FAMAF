{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
import Distribution.Simple.Setup (trueArg)
-- parcial 2025
-- Tema A
-- Ejercicio 1

-- Ejercicio 1)a)

data TipoYerba  = ConPalo | SinPalo | Compuesta deriving Show
data Origen = Organica | Agroecologica deriving Show
data Paquete = PaqueteNormal TipoYerba Cantidad | PaquetePremium TipoYerba Cantidad Origen deriving Show

-- Sinonimos de tipo

type Cantidad = Int



-- Ejercicio 1)b)

-- Funciones auxiliares

con_palo :: TipoYerba -> Bool
con_palo ConPalo = True
con_palo _ = False


igual_tipo_yerba :: TipoYerba -> TipoYerba -> Bool
igual_tipo_yerba ConPalo ConPalo = True
igual_tipo_yerba SinPalo SinPalo = True
igual_tipo_yerba Compuesta Compuesta = True
igual_tipo_yerba _ _ = False



-- 



es_yerba_con_palo :: Paquete -> Bool
es_yerba_con_palo (PaqueteNormal t1 _ ) = con_palo t1
es_yerba_con_palo (PaquetePremium t1 _ _ ) = con_palo t1



-- Ejemplo

{-
ghci> es_yerba_con_palo (PaqueteNormal ConPalo  2)
True
ghci> es_yerba_con_palo (Paquete ConPalo  2)
Paquete         PaqueteNormal   PaquetePremium
ghci> es_yerba_con_palo (PaquetePremium  ConPalo  2 Agroecologica )
True
ghci> 

-}

-- 

agregar_paquete :: Paquete -> [Paquete] -> [Paquete]
agregar_paquete p xs = p : xs

-- Ejemplo 
{-
ghci> agregar_paquete  (PaquetePremium  ConPalo  2 Agroecologica) []
[PaquetePremium ConPalo 2 Agroecologica]
ghci> agregar_paquete (PaqueteNormal ConPalo  2) [PaquetePremium ConPalo 2 Agroecologica]
[PaqueteNormal ConPalo 2,PaquetePremium ConPalo 2 Agroecologica]
ghci> 
-}
-- 

cuantos_kilos :: [Paquete] -> TipoYerba -> Int
cuantos_kilos [] _ = 0
cuantos_kilos (PaqueteNormal t1 c1:xs) t2 | igual_tipo_yerba t1 t2 = c1 + cuantos_kilos xs t2 
                                            | otherwise = cuantos_kilos xs t2

cuantos_kilos (PaquetePremium t1 c1 _:xs) t2 | igual_tipo_yerba t1 t2 = c1 + cuantos_kilos xs t2 
                                            | otherwise = cuantos_kilos xs t2

-- Ejemplo 

{-
ghci> cuantos_kilos  [PaqueteNormal ConPalo 2,PaquetePremium ConPalo 2 Agroecologica] Compuesta 
0
ghci> cuantos_kilos  [PaqueteNormal ConPalo 2,PaquetePremium ConPalo 2 Agroecologica] ConPalo 

4
ghci> 
-} 

-- 

-- Ejercicio 2


-- Ejercicio 2)a)

data StockPaquetes = AgregarPaquete Paquete StockPaquetes | NoHayPaquetes deriving Show


-- Funciones auxiliares

igual_origen :: Origen -> Bool
igual_origen Organica = True
igual_origen _ = False

es_organica_5kg :: Paquete -> Bool
es_organica_5kg (PaqueteNormal _ c) = False
es_organica_5kg (PaquetePremium _ c origen) = igual_origen origen && (c == 5) 


-- Ejercicio 2)b)

hay_organica_de_5kg :: StockPaquetes -> Bool
hay_organica_de_5kg NoHayPaquetes = False
hay_organica_de_5kg (AgregarPaquete paquete resto) = es_organica_5kg paquete   || hay_organica_de_5kg resto

-- Ejemplo


-- 

-- Ejercicio 3

vender_cantidad :: [Paquete] -> TipoYerba -> Int -> Maybe [Paquete]
