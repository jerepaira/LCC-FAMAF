-- Ejercicos 1

-- Ejercicos 1)a)
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

data Periferico = Mouse Dpi ManoHabil Bluetooth | Camara Resolucion Mic | GamePad Marca Analogico Botones Bluetooth  deriving Show

-- Tipos de datos algebraicos

data ManoHabil  = Derecha | Izquierda deriving Show

type Dpi  = Int
type Bluetooth = Bool
type Resolucion = Int
type  Mic  = Bool
type Marca = String
type Analogico = Bool
type Botones = Int

-- Ejercicos 1)b)

buena_para_videoconferencias :: Periferico -> Bool
buena_para_videoconferencias (Camara resolucion microfono) = resolucion >= 3 &&  microfono 
buena_para_videoconferencias _  = False

-- Funcion auxiliar

tieneBt :: Periferico -> Bool
tieneBt (Mouse _ _ b1) = True
tieneBt (GamePad _ _ _ b2)= True
tieneBt _ = False

-- tieneBt' :: Periferico -> Bool
-- tieneBt' (Mouse _ _ b1) = b1 
-- tieneBt'(GamePad _ _ _ b2)= b2
-- tieneBt' _ = False


solo_bt :: [Periferico] -> [Periferico]
solo_bt [] = []
solo_bt (x:xs) | tieneBt x = x : solo_bt xs
                | otherwise = solo_bt xs


cuantos_bt :: [Periferico] -> Int
cuantos_bt [] = 0
cuantos_bt (x:xs) | tieneBt x = 1 + cuantos_bt xs
                | otherwise = cuantos_bt xs

-- Ejercicos 2

-- Ejercicos 2)a)

data CajaPeriferico = AgregarPeriferico Periferico CajaPeriferico | CajaVacia 

-- Ejercicos 2)b)

todos_bluetooth :: CajaPeriferico -> Bool
todos_bluetooth CajaVacia = True
todos_bluetooth (AgregarPeriferico p1 resto) = tieneBt p1 && todos_bluetooth resto