import Distribution.SPDX (LicenseId(TORQUE_1_1))
import Language.Haskell.TH (Con)
import Text.XHtml (alt)
{- 
Parcial 1 2023-09-18 (Tema A)
-}

-- Ejercicio 1

-- Ejercicio 1)a)
-- Respuesta: 2

-- Ejercicio 1)b)
-- Respuesta: 2

-- Ejercicio 1)c)
-- Respuesta: 3

-- Ejercicio 1)d)
-- Respuesta: 3


-- Ejercicio 2

-- Ejercicio 2)a)

data MaterialesConstruccion = Ladrillo TipoLadrillo UsoDeLadrillo Precio | Vigueta Largo MaterialViga Precio | Cemento MarcaCemento Precio deriving Show

-- tipos enumerados

data TipoLadrillo = Ceramico | Hormigon | Tradicional  deriving Show
data UsoDeLadrillo = Pared | Techo  deriving Show
data MaterialViga = Hierro | Madera deriving Show
data MarcaCemento = Minetti | Lomanegra deriving Show

-- Sinonimos de tipo

type Precio = Int
type Largo = Float

-- Ejercicio 2)b)

ladrillosDeMenorPrecio :: [MaterialesConstruccion] -> Int -> [MaterialesConstruccion]
ladrillosDeMenorPrecio [] _ = []
ladrillosDeMenorPrecio (Ladrillo t1 u1 n1:lm) n2 | n1 <=n2 = Ladrillo t1 u1 n1 : ladrillosDeMenorPrecio lm n2
                                                | otherwise = ladrillosDeMenorPrecio lm n2
ladrillosDeMenorPrecio (_:lm) n2 = ladrillosDeMenorPrecio lm n2

-- Ejemplo 
{-
ghci> ladrillosDeMenorPrecio [Ladrillo Ceramico Pared 100, Vigueta 10.1 Hierro 50] 200
[Ladrillo Ceramico Pared 100]
ghci> ladrillosDeMenorPrecio [Ladrillo Ceramico Pared 100] 200
[Ladrillo Ceramico Pared 100]
-} 

-- Ejercicio 2)c)

-- funciones auxiliares
tipoLadrillosIguales :: TipoLadrillo -> TipoLadrillo -> Bool
tipoLadrillosIguales Ceramico Ceramico = True
tipoLadrillosIguales Hormigon Hormigon = True
tipoLadrillosIguales Tradicional Tradicional = True
tipoLadrillosIguales _ _ = False

materialDeVigaIgual :: MaterialViga -> MaterialViga -> Bool
materialDeVigaIgual Hierro Hierro = True
materialDeVigaIgual Madera Madera  = True
materialDeVigaIgual _ _  = False

cementoMarcaIgual :: MarcaCemento -> MarcaCemento -> Bool
cementoMarcaIgual Lomanegra Lomanegra = True
cementoMarcaIgual Minetti Minetti  = True
cementoMarcaIgual _ _ = False

igualLadrillos :: MaterialesConstruccion -> MaterialesConstruccion -> Bool
igualLadrillos (Ladrillo t1 u1 p1) (Ladrillo t2 u2 p2)  | tipoLadrillosIguales t1 t2 && p1==p2 = True
                                                        | otherwise = False

igualViguetas :: MaterialesConstruccion -> MaterialesConstruccion -> Bool
igualViguetas (Vigueta l1 m1 p1) (Vigueta l2 m2 p2) | l1 == l2 && materialDeVigaIgual m1 m2 = True
                                                    |  otherwise = False

igualCemento :: MaterialesConstruccion -> MaterialesConstruccion -> Bool
igualCemento (Cemento m1 p1) (Cemento m2 p2) | cementoMarcaIgual m1 m2 = True
                                             | otherwise = False

-- funcion general 

gmaterialConstruccion :: MaterialesConstruccion -> MaterialesConstruccion -> Bool
gmaterialConstruccion (Ladrillo t1 u1 p1) (Ladrillo t2 u2 p2) = tipoLadrillosIguales t1 t2 && p1 == p2
gmaterialConstruccion (Vigueta l1 m1 p1) (Vigueta l2 m2 p2) = l1 == l2 && materialDeVigaIgual m1 m2
gmaterialConstruccion (Cemento m1 p1) (Cemento m2 p2) = cementoMarcaIgual m1 m2
gmaterialConstruccion _ _ = False


-- Ejercicio 3

-- Ejercicio 3)a)

data ArbolesNativos = EvolucionDelArbol String Estado Int Int Int  ArbolesNativos | NoHayMasArboles

-- Tipos Enumerados 

data Estado = Seco | EnFlor | Verde | ConFrutos

-- Ejercicio 3)b)

-- Funcion auxiliar

venderSegunEstado :: Estado -> Int -> Int -> Int -> Bool
venderSegunEstado ConFrutos _ _ _  = True
venderSegunEstado EnFlor diametro alto apreciacion = (diametro > 7 || alto > 7) && apreciacion >= 8
venderSegunEstado Verde diametro alto apreciacion = diametro >= 9 && alto == 9 && apreciacion == 9  
venderSegunEstado Seco _ _ _  = False

-- Funcion general

paraVender :: ArbolesNativos -> String -> Bool
paraVender NoHayMasArboles _ = False
paraVender (EvolucionDelArbol nombre estado diametro alto apreciacion  resto) nombreBuscado | nombre == nombreBuscado = venderSegunEstado estado diametro alto apreciacion 
                                                                                            | otherwise = paraVender  resto nombreBuscado 

