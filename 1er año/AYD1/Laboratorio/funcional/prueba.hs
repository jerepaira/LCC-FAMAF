{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
import Distribution.Simple.Program.HcPkg (list)

-- Ejercicio 1

-- Ejercicio 1)a)

data Lanzamiento = Album Nombre Artista ListaTemas Año | Sencillo Nombre Artista Duracion Año deriving Show

-- sinonimos de tipo
type Nombre = String
type Artista = String
type Año = Int
type ListaTemas = [Nombre]
type Duracion = Int


-- Ejercicio 1)b)

-- funcion auxiliar 

listaTemas :: [Nombre]
listaTemas = ["Nos siguen pegando abajo", "No soy un extraño", "Dos cero uno", "Nuevos trapos","Bancate ese defecto", "No me dejan salir", "Los dinosaurios", "Plateado sobre plateado", "Ojos de video tape"]


clicsModernos :: Lanzamiento
clicsModernos = (Album "Clics Modernos" "Charly García" listaTemas 1983)


africa :: Lanzamiento
africa = (Sencillo "Africa" "Toto" 260 1982)

-- Ejercicio 1)c)

esDelArtista :: Lanzamiento -> String -> Bool
esDelArtista (Sencillo nombre artista duracion  year) n1 = artista == n1
esDelArtista _ _ = False


-- Ejercicio 1)d)

esEP :: Lanzamiento -> Bool
esEP (Album nombre artista lista year) = length lista <= 4

-- Ejercicio 1)e)

minSencillosArtista :: [Lanzamiento] -> String -> Int
minSencillosArtista [] _ = 0
minSencillosArtista ((Sencillo nombre artista duracion  year ):xs) nombre1 = duracion + sumaSencillos xs 

-- funcion auxiliar 

sumaSencillos :: [Lanzamiento] -> Int
sumaSencillos [] = 0
sumaSencillos ((Sencillo nombre artista duracion  year ):xs) = (duracion + sumaSencillos xs) `div` 60
sumaSencillos (_:xs) = sumaSencillos xs

-- Ejercicio 2

data ColaLanzamiento =  Vacia | Encolada  Lanzamiento ColaLanzamiento deriving Show

soloSencillos :: ColaLanzamiento -> ColaLanzamiento
soloSencillos Vacia = Vacia
soloSencillos  (Encolada  (Sencillo nombre artista duracion año) resto) =   Encolada (Sencillo nombre artista duracion año) (soloSencillos resto)
soloSencillos (Encolada _ resto) = soloSencillos resto