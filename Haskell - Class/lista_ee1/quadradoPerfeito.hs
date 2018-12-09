module Main where 
    import Data.Char
    
    prompt = do number <- getLine
                return number
    
    main :: IO()
    main = do n <- prompt
              checkNum (read n :: Int)
              return()
    
    
    checkPrimo :: Int -> Int -> Bool
    checkPrimo x y
     | y == 1 = True
     | mod x y == 0 = False
     | otherwise = checkPrimo x (y - 1)
     
    
    ehPrimo :: Int -> Bool
    ehPrimo x = checkPrimo x (x - 1)
    
    square = map (\x -> x*x) [0..]
    quadradoPerfeito :: Int -> Bool
    quadradoPerfeito n = n == (head $ dropWhile ( < n) square)
    
    checkNum :: Int -> IO()
    checkNum n 
     | quadradoPerfeito n == True = putStrLn "Quadrado Perfeito"
     | ehPrimo n == True = putStrLn "Primo"
     | otherwise = putStrLn "Natural"
    