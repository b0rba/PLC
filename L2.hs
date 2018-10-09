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