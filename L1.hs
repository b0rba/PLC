
-- 2q
subListas :: [Int] -> [[Int]]
subListas [] = [[]]
subListas (x:xs) = [x : subL | subL <- subListas xs] ++ subListas xs

-- 3q

--a
poli :: Integer -> Integer -> Integer -> (Integer -> Integer)
--poli a b c = (\x -> (a*x*x + b*x + c)) 
poli a b c = f
            where f x = (a*x*x + b*x + c)

--b
listaPoli :: [(Integer, Integer, Integer)] -> [Integer -> Integer]
listaPoli ((a,b,c):xs) = [poli a b c ] ++ listaPoli xs
listaPoli _ = []

--c
appListaPoli :: [Integer -> Integer] -> [Integer] -> [Integer]
appListaPoli (x:xs) (y:ys) = [x y] ++ appListaPoli xs ys
appListaPoli _ _ = []

-- 4q

--a
matriz :: [[Integer]] -> Bool
matriz [] = True
matriz (x:[]) = True 
matriz (x:y:ys) 
                | length x == length y = matriz (y:ys)
                | otherwise = False

--b init, take, drop, !!

perm :: [[Integer]] -> Int -> Int -> [[Integer]]
perm x y z = b ++ i ++ m ++ j ++ a
        where
            b = take y x
            i = [x !! z]
            m = take (z-y) (drop (y+1) x)
            j = [x !! y]
            a = drop (z+1) x


-- 6q

{-
Defina a fun¸c˜ao altMap :: (a -> b) -> (a -> b) -> [a] -> [b] que, de forma alternada, aplica
as duas fun¸c˜oes dadas como argumentos aos elementos sucessivos na lista, respeitando a ordem deles.
> altMap (+10) (+100) [0, 1, 2, 3, 4]
[10, 101, 12, 103, 14]
-}

altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap f1 f2 (x:xs) = f1 x : altMap f2 f1 xs


-- 7q

type Codigo = Int
data Voto = Presidente Codigo | 
            Senador Codigo | 
            Deputado Codigo |
            Branco  deriving (Show)                 
type Urna = [Voto]
type Apuracao = [(Voto, Integer)]

instance Eq Voto where
    (Presidente p1) == (Presidente p2) = p1 == p2
    (Senador s1)   == (Senador s2)   = s1 == s2  
    (Deputado d1) == (Deputado d2)  = d1 == d2
    Branco == Branco = True
    _ == _ = False

umaUrna = [
    (Presidente 1), (Presidente 1) , 
    (Senador 1),(Senador 1),(Senador 1),
    (Presidente 2), (Presidente 3),
    (Deputado 1), (Deputado 1),(Deputado 1),
    (Deputado 1), (Deputado 1),(Deputado 1), 
    (Deputado 1), (Deputado 1),(Deputado 1),
    Branco, Branco, (Presidente 1)
    ]

totalVotos :: Urna -> Voto  -> Int
totalVotos u v = length([ x | x <- u , x == v ]) 

apurar :: Urna -> Apuracao -> Apuracao

