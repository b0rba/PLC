--1
-- Se o numero n>=2 vezes, imprimi n-1
--a
f :: [Int] -> [Int]
f [x] = []
f (x:y:ys) | x == y    = x : f (y:ys)
           | otherwise = f (y:ys) 
--b
f1 :: [Int] -> [Int]
f1 (x:xs) = [ x | (x,y) <- zip (x:xs) xs , x == y]

--2 
g :: [Int] -> Bool
g l = foldr (&&) True ( map (\y -> y `mod` 2 == 0) (filter(\z -> z >=0 && z<=100) l) )

--3

{-
3. Uma lˆampada ´e caracterizada por ser compacta ou incandescente. Al´em, disso, toda
lˆampada possui o nome do seu fabricante e a potˆencia como um valor em Watts.
(a) Defina o tipo alg´ebrico Lampada, de acordo com as caracter´ısticas descritas
(b) Estabele¸ca que exibir uma lˆampada resulta em uma string que come¸ca com a
palavra “Compacta”, no caso de lˆampada compacta, ou com a string “Incandescente”.
Estas strings s˜ao seguidas do nome do fabricante e da potˆencia da
lˆampada. Ou seja, defina que o tipo Lampada ´e instˆancia da classe Show.
(c) Estabele¸ca que o tipo Lampada ´e uma instˆancia da classe Eq, de modo que
duas lˆampadas s˜ao iguais se forem compactas e possu´ırem o mesmo fabricante
e potˆencia. O mesmo vale para lˆampadas incandescentes.
-}
type Nome = String;
type Potencia = Int;
data Lampada = Compacta Nome Potencia | Incand Nome Potencia

instance Show Lampada where
    show (Compacta n1 p1) = "Compacta " ++ n1 ++ " " ++ show p1
    show (Incand n2  p2) = "Incandecente " ++ n2 ++ " " ++ show p2

instance Eq Lampada where
    (Compacta n01 p01) == (Compacta n02 p02) = n01 == n02 && p01 == p02
    (Incand n11 p11)   == (Incand n12 p12)   = n11 == n12 && p11 == p12
    (Compacta n01 p01) == (Incand n12 p12)   = False
    (Incand n11 p11)   == (Compacta n02 p02) = False

