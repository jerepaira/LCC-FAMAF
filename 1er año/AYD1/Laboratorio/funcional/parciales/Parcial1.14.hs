-- Ejercicio 1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

data TipoYerba = ConPalo | SinPalo | Compuesta deriving Show
data Paquete = PaqueteNormal TipoYerba Cantidad | PaquetePremium TipoYerba Cantidad Origen deriving Show
data Origen = Organica | Agroecologica deriving Show

-- Sinonimos de Tipo 
type Cantidad = Int
-- Funciones auxiliares
con_palo :: TipoYerba  -> Bool
con_palo ConPalo = True
con_palo _   = False
-- 

es_yerba_con_palo :: Paquete -> Bool
es_yerba_con_palo (PaqueteNormal tipo _ ) = con_palo tipo  
es_yerba_con_palo (PaquetePremium tipo _ _  ) = con_palo tipo  

-- Ejemplo 

{-
ghci> es_yerba_con_palo  (PaqueteNormal ConPalo  20)
True
ghci> es_yerba_con_palo  (PaqueteNormal Compuesta   20)
False
-} 

agregar_paquete :: Paquete -> [Paquete] -> [Paquete]
agregar_paquete p paquetes = p:paquetes

-- Ejemplo 

{-
ghci> agregar_paquete (PaqueteNormal ConPalo  20) []
[PaqueteNormal ConPalo 20]
ghci> agregar_paquete (PaqueteNormal ConPalo  20) [(PaqueteNormal ConPalo  300)]
[PaqueteNormal ConPalo 20,PaqueteNormal ConPalo 300]
ghci> 
-} 

-- Funciones auxiliares
mismo_tipo_yerba :: TipoYerba -> TipoYerba -> Bool
mismo_tipo_yerba ConPalo ConPalo = True
mismo_tipo_yerba SinPalo SinPalo = True
mismo_tipo_yerba Compuesta Compuesta = True
mismo_tipo_yerba _ _ = False

-- 


cuantos_kilos :: [Paquete] -> TipoYerba -> Int
cuantos_kilos [] _ = 0
cuantos_kilos ((PaqueteNormal tipo cantidad):xs) tipo2 | mismo_tipo_yerba tipo tipo2 = cantidad + cuantos_kilos xs tipo2 
                                                        | otherwise = cuantos_kilos xs tipo2 
cuantos_kilos ((PaquetePremium tipo cantidad _):xs) tipo2 | mismo_tipo_yerba tipo tipo2 = cantidad + cuantos_kilos xs tipo2 
                                                        | otherwise = cuantos_kilos xs tipo2 


-- Ejercicio 2

-- Ejercicio 2)a)

data StockPaquetes  = AgregarPaquete Paquete StockPaquetes| NoHayPaquete deriving Show
 
-- Ejercicio 2)b)

-- Funciones auxiliares
es_organica :: Origen -> Bool
es_organica Organica = True
es_organica _ = False
-- 
hay_organica_de_5kg :: StockPaquetes -> Bool
hay_organica_de_5kg NoHayPaquete = False
hay_organica_de_5kg (AgregarPaquete (PaquetePremium tipo 5 origen) resto) | es_organica origen = True
                                                                                | otherwise = hay_organica_de_5kg resto
hay_organica_de_5kg (AgregarPaquete _ resto) = hay_organica_de_5kg resto


