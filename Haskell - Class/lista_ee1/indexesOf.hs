
module Main where 
    import Data.List (elemIndices)
    
    main :: IO()
    main = do s <- getLine
              n <- getLine
              putStrLn $ show $ indexList s n
              return()
    
    indexList :: [Char] -> [Char] -> [Int]
    indexList [] _ = []
    indexList (xs) (ch:cs) = elemIndices ch xs 