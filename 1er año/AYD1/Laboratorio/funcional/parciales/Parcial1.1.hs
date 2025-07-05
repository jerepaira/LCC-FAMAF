{- 
Parcial 1 2023-09-18 (Tema D)
-}

-- Ejercicio 1

-- Ejercicio 1)a)
-- Respuesta: 2)


-- Ejercicio 1)b)
-- Respuesta: 3)

-- Ejercicio 1)c)
-- Respuesta: 5)

-- Ejercicio 1)d)
-- Respuesta: 1)


-- Ejercicio 2

-- Ejercicio 2)a)

data Perecedero = Leche TipoDeLeche UsoDeLeche Precio | Carne Corte Peso Precio| Queso TipoDeQueso Peso Precio

-- Tipos enumerados de Leche
data TipoDeLeche = Descremada | Entera | Condenzada | Polvo
data UsoDeLeche = Bebida | Preparaciones 

-- Tipos enumerados de Carne
data Corte = Bife | Molida | Pulpa

-- Tipos enumerados de Queso
data TipoDeQueso = Barra | Cremoso | Duro 

-- Sinonimos de tipo
type Precio = Int
type Peso = Float

-- Ejercicio 2)b)

-- funciones auxiliares

tipoQuesoEq :: TipoDeQueso -> TipoDeQueso -> Bool
tipoQuesoEq  Barra Barra = True
tipoQuesoEq  Cremoso Cremoso = True
tipoQuesoEq  Duro Duro = True
tipoQuesoEq _ _  = False

tipoLecheEq :: TipoDeLeche -> TipoDeLeche -> Bool
tipoLecheEq Descremada Descremada = True
tipoLecheEq Entera Entera = True
tipoLecheEq Condenzada Condenzada = True
tipoLecheEq Polvo Polvo = True
tipoLecheEq _ _ = False

tipoCarneEq :: Corte -> Corte -> Bool
tipoCarneEq Bife Bife = True
tipoCarneEq Molida Molida = True
tipoCarneEq Pulpa Pulpa = True
tipoCarneEq _ _ = False

-- 

cuantosQuesos :: [Perecedero] -> TipoDeQueso -> Int
cuantosQuesos [] _  = 0
cuantosQuesos (Queso tipo _ _ :xs) t1 | tipoQuesoEq tipo t1 = 1 + cuantosQuesos xs t1 
                                        | otherwise = cuantosQuesos xs t1
cuantosQuesos (_:xs) t1 = cuantosQuesos xs t1


-- ejemplo
{-
ghci> cuantosQuesos  [(Queso Cremoso 2 100),(Queso Duro 1 50)] Cremoso
1
ghci> cuantosQuesos  [(Queso Cremoso 2 100),(Queso Duro 1 50)] Duro
1
ghci> cuantosQuesos  [(Queso Cremoso 2 100),(Queso Cremoso 1 50)] Duro
0
ghci> cuantosQuesos  [(Queso Cremoso 2 100),(Queso Cremoso 1 50)] Cremoso
2
-}

-- Ejercicio 2)c)

igualPerecedero :: Perecedero -> Perecedero -> Bool
igualPerecedero (Leche t1 _ _  ) (Leche t2 _ _ ) = tipoLecheEq t1 t2 
igualPerecedero (Carne c1 _ _ ) (Carne c2 _ _ ) = tipoCarneEq c1 c2
igualPerecedero (Queso p1 _ _ ) (Queso p2 _ _ ) = tipoQuesoEq p1 p2 
igualPerecedero _ _ = False

-- ejemplo

{-
ghci> igualPerecedero  (Leche Entera Bebida 100) (Leche Entera Preparaciones 100)
True
ghci> igualPerecedero  (Leche Entera Bebida 100) (Leche Polvo Preparaciones 100)
False
-} 


-- Ejercicio 3)

-- Ejercicio 3)a)

-- Sinonimos de tipo
type Nota = Int

-- Tipos enumerados 
data Division = Septima | Sexta | Quinta | Cuarta 

data NotasDelClub = EvolucionDelJugador String Division Nota Nota Nota  NotasDelClub|  NoHayMasJugadores

-- Ejercicio 3)b)

--Funciones auxiliares 

esIgualDivision :: Division -> Division -> Bool
esIgualDivision Septima Septima = True
esIgualDivision Sexta Sexta  = True
esIgualDivision Quinta Quinta = True
esIgualDivision Cuarta Cuarta = True
esIgualDivision _ _ = False

cumpleCondicion :: Division -> Int -> Int -> Int -> Bool
cumpleCondicion d def atq pass  | esIgualDivision d Septima = (def > 7 || atq > 7) && pass >= 6
                                | esIgualDivision d Sexta = (def > 7 || atq > 7) && pass >= 6
                                | esIgualDivision d Quinta = def >= 7 && atq >= 7 && pass >= 8
                                | otherwise = False

-- 

pasaDeDivision :: NotasDelClub -> String -> Bool
pasaDeDivision (EvolucionDelJugador nombre div  def atq pass resto) buscando | nombre == buscando = cumpleCondicion div def atq pass
                                                                             | otherwise = pasaDeDivision resto buscando 
pasaDeDivision NoHayMasJugadores _ = False

-- ejemplo

{-
ghci> pasaDeDivision  (EvolucionDelJugador "jeremias paira" Quinta 8 7 8 NoHayMasJugadores) "jeremias paira" 
True
ghci> pasaDeDivision  (EvolucionDelJugador "jeremias paira" Quinta 8 7 8 NoHayMasJugadores) "jeremias" 
False
-}

-- Ejercicio 3)c)

devolverDivision :: NotasDelClub -> String -> Maybe Division
devolverDivision (EvolucionDelJugador nombre division _ _ _ resto) buscando | nombre == buscando = Just division
                                                                            | otherwise = devolverDivision resto buscando
devolverDivision NoHayMasJugadores _ = Nothing