
-- 2q
data CInt = Conjunto [Int] deriving (Show)

getInt :: CInt -> [Int]
getInt (Conjunto x) = x

getCon :: [Int] -> CInt
getCon x = (Conjunto x)


--a
makeSet :: [Int] -> CInt
makeSet l = Conjunto (filterList $ qSort l)

filterList :: [Int] -> [Int]
filterList [] = []
filterList (x:xs) = [x] ++ filterList (filter (\f -> f /= x) xs)

qSort :: (Ord a) => [a] -> [a]
qSort [] = []
qSort (x:xs) = qSort smaller ++ [x] ++ qSort bigger
        where
            smaller = [a | a <- xs, a < x]
            bigger = [a | a <- xs, a >= x]

--b
union :: CInt -> CInt -> CInt
union a b = makeSet $ getInt a ++ getInt b

--c
mapSet :: (Int -> Int) -> CInt -> CInt
mapSet f xs = getCon $ map f (getInt xs)

-- 3q

ex = T (Post ("Joao", 1) "qwert") (T (Post ("Mayru", 2) "yuiop") Nil)

type Texto = String
type Id = String
type DataHoraPub = Int

data Post = Post (Id, DataHoraPub) Texto deriving(Show, Eq)
data Thread = Nil | T Post (Thread)

--a
instance Show Thread where
    show(Nil) = []
    show (T (Post (i, d) txt) (t)) = "(" ++ i ++ " " ++ show d ++ " " ++ txt ++ ")" ++ show t

--b    
insertPost :: Post -> Thread -> Thread
insertPost p (Nil) = (T p Nil)
insertPost p (T ps t) = (T ps (insertPost p t))

--c
threadToList :: Thread -> [Post]
threadToList (Nil) = []
threadToList (T ps t) = ps : threadToList(t)

--d
listToThread :: [Post] -> Thread
listToThread (x:xs) = (T x (listToThread xs))
listToThread _ = (Nil)

--e
removePost :: (Id, DataHoraPub) -> Thread -> Thread
removePost (i, d) t = listToThread $ filter (\(Post (i', d') txt) -> i /= i' || d /= d' ) (threadToList t)