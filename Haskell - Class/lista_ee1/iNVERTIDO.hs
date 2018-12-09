module Main where 
    import Data.Char
    
    main :: IO()
    main = do n <- getLine 
              putStrLn $ getSt n
              return()
    
    
    getSt :: [Char] -> [Char]
    getSt [] = []
    getSt (x:xs) = transformar x : getSt xs
    
    transformar :: Char -> Char
    transformar x = if (isLower x) then (toUpper x) else (toLower x) 