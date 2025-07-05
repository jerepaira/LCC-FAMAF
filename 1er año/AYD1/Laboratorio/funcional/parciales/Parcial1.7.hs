import Data.Time.Calendar.Quarter (monthOfYearQuarter)
{-
Parcial 1 2024-04-22 (Tema B)
-}

-- Ejercicio 1

-- Ejercicio 1)a)

data Auto = SoloA | ConTrailer Ejes Altura  deriving Show

data Rodado = Moto | Automovil Auto | Bus Ejes Altura  | Camion Ejes Altura  Peso deriving Show  

-- Sinonimos de tipo 
type  Ejes = Int
type Altura = Float 
type  Peso = Int


-- Ejercicio 1)b)

igualAuto :: Auto -> Auto -> Bool
igualAuto SoloA SoloA = True
igualAuto (ConTrailer eje1 altura1) (ConTrailer eje2 altura2) = eje1 == eje2
igualAuto _ _ = False
 
igualEjes :: Auto -> Auto -> Bool
igualEjes (ConTrailer e1 a1) (ConTrailer e2 a2) | e1 == e2  = True
                                                | e1>e2 = a1<a2
                                                |e2>e1 = a2<a1
                                                |otherwise = False
igualEjes _ _ = False



igualRodado :: Rodado -> Rodado -> Bool
igualRodado  Moto Moto =  True
igualRodado (Automovil auto) (Automovil auto1) = igualAuto auto auto1
igualRodado (Bus eje altura) (Bus eje2 altura2) = igualEjes (ConTrailer eje altura) (ConTrailer eje2 altura2)
igualRodado (Camion eje1 al1 pre1) (Camion ej2 al2 pe2) = igualEjes (ConTrailer eje1 al1) (ConTrailer eje1 al2) 
igualRodado _ _ = False

-- Ejercicio 1)c)

