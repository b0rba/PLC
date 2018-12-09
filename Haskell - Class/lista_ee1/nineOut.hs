module Main where 
    import Data.Char 
    
    main :: IO()
    main = do n <- getLine
              printando n
              return()
    
    printando :: [Char] -> IO()
    printando (xs) = putStrLn $ show $ getInts xs
    
    getInts :: [Char] -> Int
    getInts [] = 0
    getInts (x:xs) = digitToInt x + getInts xs 