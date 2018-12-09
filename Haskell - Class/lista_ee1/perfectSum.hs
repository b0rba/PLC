module Main where 
-- main :: IO()
-- main = do inp <- getLine
--           sm <- getLine
--           putStrLn $ show $ length $ checkSum (somaMatriz (sublistas (read inp :: [Int]))) (read sm :: Int)
--           return()


sublistas :: [Int] -> [[Int]]
sublistas []      =  [[]]
sublistas (x:xs)  =  [ x:ys | ys <- sublistas xs ] ++ sublistas xs

checkSum ::[Int] -> Int -> [Int]
checkSum [] n = []
checkSum (x:xs) n = if x == n
                    then x : checkSum xs n
                    else checkSum xs n

somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = x + somaLista xs

somaMatriz :: [[Int]] -> [Int]
somaMatriz [] = []
somaMatriz (x:xs) = somaLista x : somaMatriz xs