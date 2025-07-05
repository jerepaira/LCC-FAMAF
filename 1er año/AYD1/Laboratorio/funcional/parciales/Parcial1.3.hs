import Data.Kind (Type)     
{-Parcial 1 2024-09-28 (Tema B-} 

-- Ejercicio 1

-- Ejercicio 1a)

data Video = Pelicula NombrePelicula Director Duracion Año | CapSerie NombreSerie  NumeroCap Temporada Año deriving Show

-- Sinonimos de tipo

type NombrePelicula  = String
type Director = String
type Duracion = Int
type Año = Int
type NombreSerie = String
type NumeroCap = Int
type Temporada = Int

-- Ejercicio 1b)

odisea2001 :: Video
odisea2001  = Pelicula "2001: Odisea del espacio" "Stanley Kubrick" 142 1968

theOfficeS02E05 :: Video
theOfficeS02E05 = CapSerie "The Office" 5 2 2005

-- Ejercicio 1c)

esDelDirector :: Video -> String -> Bool
esDelDirector (Pelicula _ d1 _ _ ) n1 = d1 == n1
esDelDirector (CapSerie _ _ _ _) _ = False

-- Ejercicio 1d)

esActual :: Video -> Bool
esActual (CapSerie _ _ _ a1)    | a1>= 2020 = True
                                |otherwise = False

-- Ejercicio 1e)

tiempoPelis :: [Video] -> Int -> Int
tiempoPelis ((Pelicula _ _ d1 a1):xs) a2 | a1 == a2 = d1  + tiempoPelis xs a2
                                            | otherwise = tiempoPelis xs a2
tiempoPelis (_:xs) a2 = tiempoPelis xs a2


-- Ejercicio 2

data ColaVideo = Vacia | Encolada Video ColaVideo deriving Show

esCapituloSerie :: Video -> Bool 
esCapituloSerie (CapSerie _ _ _ _ ) = True
esCapituloSerie _ = False 

seriesActuales :: ColaVideo -> ColaVideo 
seriesActuales Vacia = Vacia
seriesActuales (Encolada video resto) | esCapituloSerie video = Encolada video (seriesActuales resto)
                                      |otherwise = seriesActuales resto