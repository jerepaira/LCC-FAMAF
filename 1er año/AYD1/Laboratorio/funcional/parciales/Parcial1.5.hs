
{-
Parcial 1 2023-09-18 (Tema B )
-} 

-- Ejercicio 1

-- Ejercicio 1)a)
-- Respuesta: 3

-- Ejercicio 1)b)
-- Respuesta: 5

-- Ejercicio 1)c)
-- Respuesta: 2

-- Ejercicio 1)d)
-- Respuesta: 4

-- Ejercicio 2

-- Ejercicio 2)

-- Ejercicio 2)a)

data ArticulosLibreria = Libro Categoria Editorial Titulo Precio | Agenda Marca AnioAgenda Precio | Cuaderno Marca Precio deriving Show

-- Tipos enumerados

data Categoria = Literatura | Infantiles | AutoAyuda | Comics deriving Show
data Editorial = Altea | Minotauro | Panini deriving Show
data Marca = MonoBlock | Paprika deriving Show

-- Sinonimos de tipo

type Titulo = String
type Precio = Int 
type AnioAgenda = Int


-- Ejercicio 2)b)

librosBaratos :: [ArticulosLibreria] -> Precio -> [ArticulosLibreria]
librosBaratos [] _ = []
librosBaratos ((Libro c1 e1 t1 p1 ):ls) p2  | p1 <= p2  = Libro c1 e1 t1 p1  : librosBaratos ls p2
                                        | otherwise = librosBaratos ls p2
librosBaratos (_:ls) p2 = librosBaratos ls p2

-- Ejemplo 
{-
ghci> librosBaratos [Libro Literatura Altea "ese" 2000] 3500
[Libro Literatura Altea "ese" 2000]
ghci> librosBaratos [Libro Literatura Altea "ese" 5000] 3500
[]
-}

-- Ejercicio 2)c)

-- Funciones auxiliares

igualEditorial :: Editorial -> Editorial -> Bool
igualEditorial Altea Altea = True
igualEditorial Minotauro Minotauro = True
igualEditorial Panini Panini = True
igualEditorial _ _ = False


-- 

igualArticulo :: ArticulosLibreria -> ArticulosLibreria -> Bool
igualArticulo (Libro c1 e1 t1 p1) (Libro c2 e2 t2 p2) = igualEditorial e1 e2 && p1 == p2
igualArticulo (Agenda m1 a1 p1) (Agenda m2 a2 p2) =  a1 == a2 && p1 == p2
igualArticulo (Cuaderno m1 p1) (Cuaderno m2 p2) = p1 == p2
igualArticulo _ _ = False

-- Ejemplo 





-- Ejercicio 3

-- Ejercicio 3)a)

data NotasDeIngles = EvolucionDelEstudiante String Nivel Int Int Int NotasDeIngles | NoHayEstudiantes 

-- Tipo Enumerado
data Nivel = Uno | Dos | Tres


-- Ejercicio 3)b)

-- Funciones Auxiliares 

pasaN :: Nivel -> Int -> Int -> Int -> Bool
pasaN Uno n1 n2 n3 = (n1 >= 7 && n2 >= 8 && n3>= 7) || (n1 >= 8 && n2 >= 7 && n3>= 7)
pasaN Dos n1 n2 n3 = (n1 >= 7 && n2 >= 8 && n3>= 7) || (n1 >= 8 && n2 >= 7 && n3>= 7)
pasaN Tres n1 n2 n3 = ((n1+n2)`div`2 >= 8) && (n3 >= 8)

-- 
pasaDeNivel :: NotasDeIngles -> String -> Bool
pasaDeNivel NoHayEstudiantes  _ = False
pasaDeNivel (EvolucionDelEstudiante nombre nivel n1 n2 n3 resto ) nombre'   | nombre == nombre' = pasaN nivel n1 n2 n3 
                                                                            | otherwise = pasaDeNivel resto nombre' 


-- Ejercicio 3)c)

devolverNivel :: NotasDeIngles -> String -> Maybe Nivel
devolverNivel NoHayEstudiantes _  = Nothing
devolverNivel (EvolucionDelEstudiante nombre nivel n1 n2 n3 resto) nombre'  | nombre == nombre' = Just nivel 
                                                                            | otherwise = devolverNivel resto nombre'