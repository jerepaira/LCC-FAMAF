import GHC.Generics (D)
import Distribution.Simple.Setup (trueArg)
import GHC.Integer.GMP.Internals
{-
Parcial 1 2024-04-22 (Tema D)
-}

-- Ejercicio 1

-- Ejercicio 1)a)

data Libro = Novela Nombre Genero Autor NumeroDePaginas Precio | Ensayo Nombre Tema Autor NumeroDePaginas | Poesia Nombre Estilo Autor NumeroDePaginas Precio | Cientifico Nombre AreaDeEstudio Autor NumeroDePaginas deriving Show 

-- Tipos enumerados

data Genero = Drama | Romance | Misterio | Aventura  deriving Show
 
data Tema = Politica | Filosofia | Ciencia | Historia  deriving Show

data Estilo = Clasica | Contemporanea | Experimental  deriving Show

data AreaDeEstudio = Astronomia | Fisica | Matematicas | Computacion deriving Show

-- Sinonimos de tipo

type Nombre = String
type Autor = String
type NumeroDePaginas = Int
type Precio = Int

-- Ejercicio 1)b)

-- Funciones auxiliares

igualGenero :: Genero -> Genero -> Bool
igualGenero Drama Drama = True
igualGenero Romance Romance = True
igualGenero Misterio Misterio = True
igualGenero Aventura Aventura = True
igualGenero _ _ = False

-- 

cuantasNovelasPorGenero :: [Libro] -> Genero -> Int
cuantasNovelasPorGenero [] _ = 0
cuantasNovelasPorGenero (Novela a1 g1 autor n1 p1:xs) g2 | igualGenero g1 g2 = 1 + cuantasNovelasPorGenero xs g2
                                                         | otherwise = cuantasNovelasPorGenero xs g2
cuantasNovelasPorGenero (_:xs) g2 = cuantasNovelasPorGenero xs g2

-- Ejemplo

{-
ghci> cuantasNovelasPorGenero [Novela "peli" Drama "ww" 200 1500 ] Drama
1
ghci> cuantasNovelasPorGenero [Novela "peli" Drama "ww" 200 1500 ] Misterio 
0
-} 

-- Ejercicio 1)c)

-- Funciones auxiliares

igualTema :: Tema -> Tema -> Bool
igualTema Politica Politica = True
igualTema Filosofia Filosofia = True
igualTema Ciencia Ciencia = True
igualTema Historia Historia = True
igualTema _ _  = False

igualEstilo :: Estilo -> Estilo -> Bool
igualEstilo Clasica Clasica = True
igualEstilo Contemporanea Contemporanea = True
igualEstilo Experimental Experimental = True
igualEstilo _ _  = False

igualAreaEstudio :: AreaDeEstudio -> AreaDeEstudio -> Bool
igualAreaEstudio Astronomia Astronomia = True
igualAreaEstudio Fisica Fisica = True
igualAreaEstudio Matematicas Matematicas = True
igualAreaEstudio Computacion Computacion = True
igualAreaEstudio _ _ = False
-- 


igualLibro :: Libro -> Libro -> Bool
igualLibro (Novela a1 g1 autor n1 p1) (Novela a2 g2 autor2 n2 p2) = n1==n2 && igualGenero g1 g2 && autor == autor2
igualLibro (Ensayo n1 t1 a1 npaginas) (Ensayo n2 t2 a2 npaginas2) = n1 == n2  && igualTema t1 t2  &&  a1 == a2 
igualLibro (Poesia n1 e1 a1 npaginas p1 ) (Poesia n2 e2 a2 npaginas2 p2) = n1 == n2 && igualEstilo e1 e2 && a1 == a2
igualLibro (Cientifico n1 a1 autor npaginas) (Cientifico n2 a2 autor2 npaginas2) = n1 == n2 && igualAreaEstudio a1 a2
igualLibro _ _ = False

-- Ejemplo 



-- Ejercicio 1)d)

hayDosDistintosConsecutivos :: [Libro] -> Bool
hayDosDistintosConsecutivos [] = False
hayDosDistintosConsecutivos [_] = False
hayDosDistintosConsecutivos(x:y:xs)  |  not (igualLibro x y)  = True
                                     | otherwise = hayDosDistintosConsecutivos (y:xs)

--  Ejemplo


-- Ejercicio 2

-- Ejercicio 2)a)


data EstadoEstudiantes = EvolucionDeEstudiante String Int [Int] EstadoEstudiantes | NoHayEstudiantes 

--  Funcion auxiliar

promedioEstudiante :: [Int] -> Int
promedioEstudiante [] = 0
promedioEstudiante (x:xs) = (x + promedioEstudiante xs) `div` length  xs

minimoValor :: [Int] -> Int
minimoValor [x] = x
minimoValor (x:xs) = x `min` minimoValor xs  

pasaDeAnio :: [Int] -> Bool
pasaDeAnio [] = False
pasaDeAnio (x:xs) | promedioEstudiante xs >= 7 = True
                  | promedioEstudiante xs < 7 && promedioEstudiante xs >= 6  && minimoValor xs >= 8 = True
                  | promedioEstudiante xs < 6 =  False


-- 

avanzarDeAnio :: EstadoEstudiantes -> String -> Bool
avanzarDeAnio NoHayEstudiantes _ = False
avanzarDeAnio (EvolucionDeEstudiante nombre1 e1 xs resto) nombre2  | nombre1 == nombre2 && pasaDeAnio xs = True
                                                                    | otherwise = avanzarDeAnio resto nombre2 


-- Ejercicio 2)b)

promedioGeneral :: EstadoEstudiantes -> String -> Maybe Float
promedioGeneral NoHayEstudiantes _ = Nothing
promedioGeneral (EvolucionDeEstudiante nombre e1 xs resto) nombre2 |  nombre == nombre2 = Just (fromIntegral (promedioEstudiante xs))
                                                                    | otherwise = promedioGeneral resto nombre2 

