-- TEMA B
-- Ejercicio 1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

data TipoYerba = ConPalo | SinPalo | Compuesta  deriving Show
data Origen = Organica | Agroecologica  deriving Show
data Paquete = PaqueteBasico Cantidad TipoYerba | PaqueteMejorado Cantidad TipoYerba Origen deriving Show 

-- Sinonimo de tipo
type Cantidad = Int


tiene_5kg :: Paquete -> Bool
tiene_5kg (PaqueteBasico cantidad _ )  = cantidad == 5
tiene_5kg (PaqueteMejorado cantidad _ _ )  = cantidad == 5

-- Ejemplo 
{-
    ghci> tiene_5kg  (PaqueteBasico 1 ConPalo)
False
ghci> tiene_5kg  (PaqueteBasico 5 ConPalo)
True
-}

agregar_paquete :: Paquete -> [Paquete] -> [Paquete]
agregar_paquete p paquetes = p : paquetes

-- Ejemplo 
{-
ghci> agregar_paquete  (PaqueteBasico 5 ConPalo) []
[PaqueteBasico 5 ConPalo]
ghci> agregar_paquete  (PaqueteBasico 2 ConPalo) [PaqueteBasico 5 ConPalo]
[PaqueteBasico 2 ConPalo,PaqueteBasico 5 ConPalo]
-} 

-- Funciones auxiliares 

igual_tipo_yerba :: TipoYerba -> TipoYerba -> Bool
igual_tipo_yerba ConPalo ConPalo = True
igual_tipo_yerba SinPalo SinPalo = True
igual_tipo_yerba Compuesta Compuesta = True
igual_tipo_yerba _ _  = False

cantidad_yerba :: Paquete -> TipoYerba -> Cantidad 
cantidad_yerba (PaqueteBasico cantidad tipo ) tipo' | igual_tipo_yerba tipo tipo' = cantidad
                                                    | otherwise = 0

cantidad_yerba (PaqueteMejorado cantidad tipo origen ) tipo' | igual_tipo_yerba tipo tipo' = cantidad
                                                    | otherwise = 0
                                                    
-- 

mayor_paquete :: [Paquete] -> TipoYerba -> Int
mayor_paquete [] _  = 0
mayor_paquete (p:ps) tipo = max (cantidad_yerba p tipo) (mayor_paquete ps tipo)


-- Ejemplo




-- Ejercicio 2

-- Ejercicio 2)a)

data StockPaquetes = AgregarPaquete Paquete StockPaquetes | SinPaquete deriving Show

-- Ejercicio 2)b)

hay_compuesta_de_3kg :: StockPaquetes -> Bool
hay_compuesta_de_3kg SinPaquete = False
hay_compuesta_de_3kg (AgregarPaquete (PaqueteBasico cantidad tipo )resto) =( igual_tipo_yerba tipo Compuesta && cantidad == 3) || hay_compuesta_de_3kg resto
hay_compuesta_de_3kg (AgregarPaquete (PaqueteMejorado cantidad tipo _)resto) =( igual_tipo_yerba tipo Compuesta  && cantidad == 3) || hay_compuesta_de_3kg resto
                                                                        

-- Ejercicio 3

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

la_filter :: ListaAsoc a b -> (a -> Bool) -> ListaAsoc a b
la_filter  Vacia  _ = Vacia
la_filter (Nodo clave valor resto) p | p clave = Nodo clave valor (la_filter resto p)
                                    | otherwise = la_filter resto p
