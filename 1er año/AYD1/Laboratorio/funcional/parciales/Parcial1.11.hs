{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use record patterns" #-}
import Data.Binary.Get (Decoder(Fail))
import Foreign.C (CSChar)
{-# HLINT ignore "Use newtype instead of data" #-}
{-# HLINT ignore "Use camelCase" #-}
-- Tema C

-- Ejercicio 1

data TipoGaseosa = Coca | Sprite | Pepsi  deriving Show
data TipoSnack = Papitas | Chocolate | Alfajor deriving Show
data TipoMaquina = MaquinaGaseosa | MaquinaSnack deriving Show


-- Sinonimos de tipo

type Peso = Int
type Precio = Int

-- Tipo algebraico

data Producto = Gaseosa TipoGaseosa Peso Precio | Snack TipoSnack Peso Precio deriving Show
data  Maquina =  Maquina TipoMaquina [Producto] deriving Show


-- Parte 2 

-- ejercicio 2)1)
es_maquina_vacia :: Maquina -> Bool
es_maquina_vacia (Maquina _ []) = True
es_maquina_vacia (Maquina _ (_:xs)) = False

-- Ejemplo 
{-
ghci> es_maquina_vacia (Maquina MaquinaGaseosa [Gaseosa Coca  1000 200])
False
ghci> es_maquina_vacia (Maquina MaquinaGaseosa [Snack  Papitas 50 200])
False
ghci> es_maquina_vacia (Maquina MaquinaGaseosa [])
True
ghci> 
-}

-- ejercicio 2)2)
                 
agregar_producto :: Producto -> Maquina -> Maquina
agregar_producto (Gaseosa tipo peso precio) (Maquina MaquinaGaseosa productos) = Maquina MaquinaGaseosa (Gaseosa tipo peso precio : productos)

agregar_producto (Snack tipo peso precio) (Maquina MaquinaSnack productos) = Maquina MaquinaSnack (Snack tipo peso precio : productos)

agregar_producto _ maquina = maquina


-- ejercicio 2)3)

-- Funcion auxiliar 

peso_productos :: Producto -> Int
peso_productos (Gaseosa _ peso _) = peso
peso_productos (Snack _ peso _) = peso


cantidad_total :: Maquina -> Int
cantidad_total (Maquina _ []) = 0
cantidad_total(Maquina tipo (x:xs)) = peso_productos x + cantidad_total (Maquina tipo xs)
 


-- Ejercicio 2

data RegistroDeReabastecimiento = ProductoAgregado Producto RegistroDeReabastecimiento| HistorialVacio deriving Show


-- Funciones auxiliares
igual_tipo_gaseosa :: TipoGaseosa -> TipoGaseosa -> Bool
igual_tipo_gaseosa Coca Coca = True
igual_tipo_gaseosa Sprite Sprite = True
igual_tipo_gaseosa Pepsi Pepsi = True
igual_tipo_gaseosa _ _ = False


contiene_gaseosa :: RegistroDeReabastecimiento -> TipoGaseosa -> Bool
contiene_gaseosa HistorialVacio  _  = False
contiene_gaseosa (ProductoAgregado (Gaseosa tipo1 _ _ )resto) tipo2 = igual_tipo_gaseosa  tipo1 tipo2 || contiene_gaseosa resto tipo2
contiene_gaseosa (ProductoAgregado (Snack _ _ _) resto) t1 = contiene_gaseosa resto t1


