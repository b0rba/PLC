poli :: Int -> Int -> Int -> ( Int -> Int)
poli a b c = (\x -> (a*x*x + b*x + c)) 