-- Ejercicio 1

-- Ejercicio 1)a)
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}

data Periferico = Mouse Dpi ManoHabil Bluetooth | Camara Resolucion Mic | GamePad Marca Analogico Botones Bluetooth deriving Show 

-- Tipos enumerados

data ManoHabil = Izquierda | Derecha deriving Show

-- Sinonimos de tipo

type Dpi = Int 
type Bluetooth = Bool
type Resolucion = Int
type Mic = Bool
type Marca = String
type Analogico = Bool
type Botones = Int

-- Ejercicio 1)b)

buena_para_videoconferencias :: Periferico -> Bool
buena_para_videoconferencias (Camara resolucion microfono) = resolucion>=3 && microfono
buena_para_videoconferencias _ = False

solo_bt :: [Periferico] -> [Periferico]
solo_bt [] = []
solo_bt ((Mouse dpi mh bth):xs) = (Mouse dpi mh bth) : solo_bt xs
solo_bt ((GamePad marca analogo botones bth):xs) = (GamePad marca analogo botones bth) : solo_bt xs
solo_bt (_:xs) = solo_bt xs


-- Funcion auxiliar 

bluetooth_activado :: Periferico -> Bool
bluetooth_activado (Mouse _ _ True) = True
bluetooth_activado (GamePad _ _ _ True) = True
bluetooth_activado _ = False

cuantos_bt :: [Periferico] -> Int
cuantos_bt [] = 0
cuantos_bt (p:xs)  | bluetooth_activado p = 1 + cuantos_bt xs
                |otherwise = cuantos_bt xs


-- Ejercicio 2

-- Ejercicio 2)a)

data CajaPeriferico = AgregarPeriferico Periferico CajaPeriferico | CajaVacia deriving Show

-- Ejercicio 2)b)

todos_bluetooth :: CajaPeriferico -> Bool
todos_bluetooth CajaVacia = True
todos_bluetooth (AgregarPeriferico p resto) = bluetooth_activado p && todos_bluetooth resto
