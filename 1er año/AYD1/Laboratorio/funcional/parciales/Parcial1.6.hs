
{-
 Parcial 1 2023-09-18 (Tema C)
-}

-- Ejercicio 1

-- Ejercicio 1)a)
-- Respuesta: 3

-- Ejercicio 1)b)
-- Respuesta: 2

-- Ejercicio 1)c)
-- Respuesta: 1

-- Ejercicio 1)d)
-- Respuesta: 6

-- Ejercicio 2

-- Ejercicio 2)a)

data ProductoDeVivero = Planta TipoPlanta Ubicacion Agua Precio | BolsaSemilla TipoSemilla Peso Precio | Maceta TipoMaceta Forma Precio

-- Tipos enumerados

data TipoPlanta = PlenoSol | MediaSombra | Floral |Frutal 
data Ubicacion = Exterior | Interior 
data Agua = MuyResistente | Resistente | NadaResistente 

data TipoSemilla = Hortalizas | Aromaticas | Cesped 

data TipoMaceta = Terracota | Fibrocemento | Plastico 
data Forma = Cuadrada | Redonda 

-- Sinonimos de tipo

type Precio = Int
type Peso = Float 

-- Ejercicio 2)b)

-- Funciones auxiliares 

igualTipoPlanta :: TipoPlanta -> TipoPlanta -> Bool
igualTipoPlanta PlenoSol PlenoSol = True
igualTipoPlanta MediaSombra MediaSombra = True
igualTipoPlanta Floral Floral = True
igualTipoPlanta Frutal Frutal = True
igualTipoPlanta _ _ = False

-- 

cuantasPlantas :: [ProductoDeVivero] -> TipoPlanta -> Int
cuantasPlantas [] _ = 0
cuantasPlantas (Planta tp1 _ _ _ :pv) tp2 | igualTipoPlanta tp1 tp2  = 1 + cuantasPlantas pv tp2 
                                             | otherwise = cuantasPlantas pv tp2
cuantasPlantas (_:pv) tp2 = cuantasPlantas pv tp2 


-- Ejemplo 
{-
ghci> cuantasPlantas  [Planta PlenoSol  Exterior NadaResistente  200, Planta PlenoSol  Exterior  NadaResistente  400, BolsaSemilla Hortalizas 40.3 80  ] PlenoSol   
2
-} 

-- Ejercicio 2)c)

-- Funciones Auxiliares

igualUbicacion :: Ubicacion -> Ubicacion -> Bool 
igualUbicacion Exterior Exterior = True
igualUbicacion Interior Interior = True
igualUbicacion _ _ = False

igualTipoMaceta :: TipoMaceta -> TipoMaceta -> Bool
igualTipoMaceta Terracota Terracota = True
igualTipoMaceta Fibrocemento Fibrocemento = True
igualTipoMaceta Plastico Plastico = True
igualTipoMaceta _ _ = False

-- 
igualProductoVivero :: ProductoDeVivero -> ProductoDeVivero -> Bool
igualProductoVivero (Planta tp1 u1 a1 p1) (Planta tp2 u2 a2 p2) = igualTipoPlanta tp1 tp2 && igualUbicacion u1 u2
igualProductoVivero (BolsaSemilla t1 pe1 pr1 ) (BolsaSemilla t2 pe2 pr2) = pe1 == pe2 && pr1 == pr2
igualProductoVivero (Maceta tp1 f1 p1) (Maceta tp2 f2 p2) = igualTipoMaceta tp1 tp2 
igualProductoVivero _ _ = False 

-- Ejemplo

{-
ghci> igualProductoVivero  (Planta PlenoSol Interior MuyResistente  200) (Planta PlenoSol Interior  NadaResistente 100)
True
ghci> igualProductoVivero  (Planta PlenoSol Interior MuyResistente  200) (Maceta Plastico Cuadrada 100)
False
-}

-- Ejercicio 3

-- Ejercicio 3)a)

data RegistroPlanta = DatoPlanta EstadoHojas Int Int Int Int RegistroPlanta | NoDato

-- Tipos enumerados

data EstadoHojas = MuchasQuemadas | PocasQuemadas | Saludables


-- Funciones auxiliares

estadoH :: EstadoHojas -> Int -> Int -> Int -> Int -> Bool
estadoH PocasQuemadas a1 c1 f1 e1 = a1 > 40
estadoH Saludables a1 c1 f1 e1 = a1 > 40
estadoH MuchasQuemadas a1 c1 f1 e1 = e1 < 10

-- Ejercicio 3)b)

trasplantar :: RegistroPlanta -> Int -> Bool
trasplantar NoDato _ = False
trasplantar (DatoPlanta estado a1 c1 f1 e1  resto) e2 | estadoH estado a1 c1 f1 e1 && e1 >= e2 = True 
                                                     | otherwise = trasplantar resto e2

-- Ejercicio 3)c)

devolverEstado :: RegistroPlanta -> Int -> Maybe EstadoHojas
devolverEstado NoDato _ = Nothing
devolverEstado (DatoPlanta estado a1 c1 f1 e1 resto ) m1 | e1 >= m1 = Just estado
                                                        | otherwise = devolverEstado resto m1