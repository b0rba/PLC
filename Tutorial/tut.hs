import Data.List
import System.IO

getFirstLetter :: String -> String
getFirstLetter [] = "Empty String"
getFirstLetter all(x:xs) = "The !(first letter) in " ++ all ++ " is " ++ show x

areStringEq :: [Char] -> [Char] -> Bool
areStringEq [] [] = True
areStringEq (x:xs) (y:ys) = x == y && areStringEq xs ys
areStringEq _ _ = False

times4 :: Int -> Int
times4 x = x * 4

doMult :: (Int -> Int) -> Int
doMult func = func 3

num3Times4 = doMult times4

fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]