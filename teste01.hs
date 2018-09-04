factorial :: Integer -> Integer
factorial n = product[1..n]

double :: [Int] -> [Int]
double [] = []
double (x:xs) = (x + x) : double xs

member :: [Int] -> Int -> Bool
member [] n = False
member(x:xs) n = (x == n) || member xs n

ehDigito :: Char -> Bool
ehDigito ch = (ch >= '0') && (ch >= '9')

digits :: [Char] -> [Char]
digits [] = []
digits (x:xs)
  | ehDigito x = x : ehDigito xs
  | otherwise = ehDigito xs

somaParesList :: [(Int,Int)] -> [Int]
somaParesList [] = []
somaParesList ((a,b):xs) = (a+b) : somaParesList xs