import Data.Fixed (Micro)
import Distribution.Simple.Command (OptDescr(BoolOpt))
{-
Parcial 1 2023-09-18 (Tema F)
-} 

-- Ejercicio 1

-- Ejercicio 1)a)
-- Respuesta: 4

-- Ejercicio 1)b)
-- Respuesta: 5

-- Ejercicio 1)c)
-- Respuesta: 5

-- Ejercicio 1)d)
-- Respuesta: 4


-- Ejercicio 2

-- Ejercicio 2)a)

data ComponentePC = Micro MarcaMicro Nucleos MaxFrec | RAM MarcaRAM Gigas | PlacaMadre MarcaPMadre Chipset deriving Show

-- Tipos parametricos

data MarcaMicro = Intel | AMD deriving Show
data Nucleos = DualCore | QuadCore | HexaCore | OctaCore deriving Show

data MarcaRAM = Kingston | MarkVision | Patriot  deriving Show

data MarcaPMadre = Asus | Asrock | MSI deriving Show
data Chipset = A630 | B650 | B660 | B760 deriving Show

-- Sinonimos de tipo

type MaxFrec = Float 
type Gigas = Int

-- Ejercicio 2)b)

-- Funciones Auxiliares

igualMarcaMicro :: MarcaMicro -> MarcaMicro -> Bool
igualMarcaMicro Intel Intel = True
igualMarcaMicro AMD AMD = True
igualMarcaMicro _ _ = False


cuantosMicros :: [ComponentePC] -> MarcaMicro -> Int
cuantosMicros [] m2 = 0
cuantosMicros (Micro m1 _ _:cs) m2  | igualMarcaMicro m1 m2 = 1 + cuantosMicros cs m2 
                                    | otherwise = cuantosMicros cs m2
cuantosMicros (_:cs) m2 = cuantosMicros cs m2

-- Ejemplo 
{-
ghci> cuantosMicros [Micro Intel DualCore 4.6,Micro AMD QuadCore 6.6] AMD
1
ghci> cuantosMicros [Micro Intel DualCore 4.6,Micro AMD QuadCore 6.6,Micro AMD OctaCore 12.2] AMD
2
-}

-- Ejercicio 2)c)

-- Funciones Auxiliares

igualNucleos :: Nucleos -> Nucleos -> Bool
igualNucleos DualCore DualCore = True
igualNucleos QuadCore QuadCore = True
igualNucleos HexaCore HexaCore = True
igualNucleos OctaCore OctaCore = True
igualNucleos _ _ = False


igualGigas :: Gigas -> Gigas -> Bool
igualGigas  m1 m2 = m1 == m2

igualMother :: Chipset -> Chipset -> Bool
igualMother A630 A630 = True
igualMother B650 B650 = True
igualMother B660 B660 = True
igualMother B760 B760 = True
igualMother _ _ = False


-- 

igualdadComponentePC :: ComponentePC -> ComponentePC -> Bool
igualdadComponentePC (Micro _ n1 _) (Micro _ n2 _) = igualNucleos n1 n2 
igualdadComponentePC (RAM _ g1) (RAM _ g2) = igualGigas g1 g2 
igualdadComponentePC (PlacaMadre _ c1) (PlacaMadre _ c2) = igualMother c1 c2
igualdadComponentePC _ _ = False

-- Ejemplo 
{-
ghci> igualdadComponentePC  (Micro Intel DualCore 3.5) (Micro AMD DualCore 3.7)
True
-}

-- Ejercicio 3

-- Ejercicio 3)a)

data PlayList = Tema Titulo Rank Estado Duracion PlayList | SinTemas

-- tipos parametricos

data Estado = Reproducido | SinReproducir

-- Sinonimos de Tipo

type Titulo = String
type Rank = Int
type Duracion = Int

-- Ejercicio 3)b)

segundosRestantes :: PlayList -> Rank -> Duracion
segundosRestantes  SinTemas  _ = 0
segundosRestantes (Tema _ r1  SinReproducir d1 resto) r2 |  r1 >= r2 = d1 + segundosRestantes resto r2
                                                         | otherwise = segundosRestantes resto r2
segundosRestantes (Tema _ _ Reproducido _ resto) r2 = segundosRestantes resto r2

-- Ejercicio 3)c)

estadoDelTema :: Titulo -> PlayList -> Maybe Estado
estadoDelTema _ SinTemas = Nothing
estadoDelTema t1 (Tema t2 _ e1 _ resto) | t1 == t2 = Just e1
                                        | otherwise = estadoDelTema t1 resto
