import Language.Haskell.TH (Callconv(Prim))
{- Parcial 1 2024-04-22 (Tema A)-}
{--}

-- Ejercicio 1

-- Ejercicio 1a)
-- tipo 
data ProductosVivero = Planta Categoria Floracion Hoja Precio| Semilla TipoSemilla Hoja Precio| Maceta Material Precio deriving Show

-- tipos  enumerados

data Categoria = Bulbosas | Rosales | Frutales | Trepadoras deriving Show
data Floracion = Primavera | Verano | Invierno deriving Show
data TipoSemilla = Flores | Hortalizas | Aromaticas deriving Show
data Material = Plastico | Barro deriving Show

-- sinonimos de tipo

type Hoja = String
type Precio = Int

-- Ejercicio 1b)
-- ya que no puedo usar la instancia Eq, debo de crear una funcion que utilice pattern machine para resolverlo, aca la funcion
categoriaFlores :: Categoria -> Categoria -> Bool
categoriaFlores Bulbosas Bulbosas = True
categoriaFlores Rosales Rosales = True
categoriaFlores Frutales Frutales = True
categoriaFlores Trepadoras Trepadoras = True


cuantasPlantas :: [ProductosVivero] -> Categoria -> Int

cuantasPlantas [] _ = 0

cuantasPlantas (Planta k floracion _ _:xs) c1 | categoriaFlores k c1 = 1 + cuantasPlantas xs c1
                                        | otherwise = cuantasPlantas xs c1

cuantasPlantas (_:xs) c1 = cuantasPlantas xs c1

-- ejemplo 
{-ghci> cuantasPlantas [Semilla Flores , (Planta Bulbosas Primavera ), Planta Bulbosas  Verano  ] Bulbosas = 2-}
 

-- Ejercicio 1c)

-- funciones auxiliares

igualCategoria :: Categoria -> Categoria -> Bool
igualCategoria Bulbosas Bulbosas = True
igualCategoria Rosales Rosales = True
igualCategoria Frutales Frutales = True
igualCategoria Trepadoras Trepadoras = True
igualCategoria _ _ = False

igualFloracion :: Floracion -> Floracion -> Bool
igualFloracion Primavera Primavera = True
igualFloracion Verano Verano  = True
igualFloracion Invierno Invierno = True
igualFloracion _ _ = False

igualSemilla :: TipoSemilla -> TipoSemilla -> Bool
igualSemilla Flores Flores = True
igualSemilla Hortalizas Hortalizas = True
igualSemilla Aromaticas Aromaticas = True
igualSemilla _ _ = False

igualMaterial :: Material -> Material -> Bool
igualMaterial Plastico Plastico = True
igualMaterial Barro Barro = True
igualMaterial _ _ = False

-- 

igualProducto :: ProductosVivero -> ProductosVivero -> Bool
igualProducto (Planta c1 f1 h1 p1) (Planta c2 f2 h2 p2) = igualCategoria c1 c2  &&  h1 == h2
igualProducto (Semilla t1 h1 p1) (Semilla t2 h2 p2) = igualSemilla t1 t2  &&  h1 == h2 && p1 == p2
igualProducto (Maceta m1 p1) (Maceta m2 p2) = igualMaterial m1 m2 && p1 == p2
igualProducto _ _ = False

-- Ejercicio 1d)
hayDosIguales :: [ProductosVivero] -> Bool
hayDosIguales [] = False
hayDosIguales[_] = False
hayDosIguales (x:y:ls)  | igualProducto x y  = True
                        | otherwise = hayDosIguales (y:ls)

-- Ejemplo


-- Ejercicio 2

-- Ejercicio 2a)

data MovieList = Movie Titulo Megusta Estado Duracion MovieList | SinMovie

-- tipos  enumerados

data Estado = Reproducido | SinReproducir 

-- Sinonimos de tipo

type Titulo = String
type Megusta = Int
type Duracion = Int

-- Ejercicio 2b)

esReproducido :: Estado -> Bool
esReproducido Reproducido = True
esReproducido _ = False

minutosReproducidos :: MovieList -> Megusta -> Duracion
minutosReproducidos SinMovie _ = 0
minutosReproducidos (Movie _ mg estado duration rest) mgsearch | esReproducido estado && mg >= mgsearch = duration + minutosReproducidos rest mgsearch
                                                                | otherwise = minutosReproducidos rest mgsearch

-- Ejercicio 2c)

estadoDePeli :: Titulo -> MovieList -> Maybe Estado
estadoDePeli _ SinMovie = Nothing
estadoDePeli t1 (Movie t2 _ estado _ resto) | t1 == t2 = Just estado
                                            | otherwise = estadoDePeli t1 resto

-- Ejemplo
