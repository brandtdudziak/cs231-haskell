import StackModule

--Question 1
--a.
isEven :: Int -> Bool
isEven x
    | mod x 2 == 0 = True
    | otherwise = False

one :: [Int]
one = 1 : map (+1) one

q1a :: [Int]
q1a = filter isEven one

--b.
isPositive :: Int -> Bool
isPositive x
     | x < 0 = False
     | otherwise = True

q1b :: [Int] -> [Int]
q1b l = map (* 2) (filter isPositive l)

--c.
sqrtApprox ::  Float -> Float -> Float
sqrtApprox n x = ((x+n/x)/2)

q1c :: Float -> Float -> [Float]
q1c n x = iterate (sqrtApprox n) x

--d.

q1d :: (Num a, Ord a) => [a] -> a -> a
q1d l x = q1dHelper (filter (inRange x) (zip (l) (tail l)))

q1dHelper :: (Num a, Ord a) => [(a,a)] -> a
q1dHelper [] = 0
q1dHelper (l:ls) = q1dHelper2 l

q1dHelper2 :: (Num a, Ord a)=> (a,a) -> a
q1dHelper2 (x, y) = y

inRange :: (Num a, Ord a) => a -> (a,a) -> Bool
inRange d (x,y)
    |(abs(x-y)) <= d = True
    |otherwise = False

--e.

q1e :: Float -> Float -> Float
q1e n r = q1d (q1c (n) (n/2)) r

--f.

applyF :: ((b -> a), b) -> a
applyF (f,b) = f b

q1f :: [(b -> a)] -> [b] -> [a]
q1f fl bl = map applyF (zip fl bl)

testFL :: [(Int -> Int)]
testFL = [testF, testF, testF, testF]

testF :: Int -> Int
testF x = x * x

--g.

q1g :: Num a=> a -> [(a -> b)] -> [b]
q1g v fl = q1f fl (repeat v)

--h.

q1h ::Eq a => a -> [a] -> [a]
q1h v l = filter (isNot v) l

isNot ::Eq a => a -> a -> Bool
isNot x v
    |x /= v = True
    |otherwise = False

--i.

q1i :: Eq a => [a] -> [a] -> [a]
q1i a b = foldr (q1h) b a

--j.

--b = list containing prefixes (list of lists)
--a = any element

q1j :: [a] -> [[a]]
q1j l = foldr q1jHelper [[]] l

q1jHelper :: a -> [[a]] -> [[a]]
q1jHelper e l = [] : map (e:) l

--k.

q1k :: Eq a=> [a] -> [[a]]
q1k l = foldr (q1kHelper) [[]] l

q1kHelper :: Eq a=> a -> [[a]] -> [[a]]
q1kHelper x ps = ps ++ (map (x:) ps)




--Question 2

sort :: Ord a => [a] -> [a]
sort l = foldr (sortHelper) [] l

sortHelper :: Ord a => a -> [a] -> [a]
sortHelper v l = foldr (sortHelper2) [v] l

sortHelper2 :: Ord a => a -> [a] -> [a]
sortHelper2 v (l:ls)
  | v < l = (v:l:ls)
  | otherwise = (l:v:ls)


--Question 3

inverted :: [[String]] -> [(String, [Int])]
inverted l = filterMultiples (invertedHelper (filterDuplicates (zip (take (length l) (zoomUp 1)) (l))))


filterDuplicates :: [(Int, [String])] -> [(Int, [String])]
filterDuplicates l = foldr (fd1) [] l

fd1 :: (Int, [String]) -> [(Int, [String])] -> [(Int, [String])]
fd1 (v, s) l = [(v, (foldr (fd2) [] s))] ++ l

fd2 :: String -> [String] -> [String]
fd2 s l = [s] ++ (filter (/= s) l)

filterMultiples :: [(String, [Int])] -> [(String, [Int])]
filterMultiples l = (foldr (fm1) [] l)

fm1 :: (String, [Int]) -> [(String, [Int])] -> [(String, [Int])]
fm1 (s, i) l = [(s, i)] ++ (foldr (fm2 s) [] l)

fm2 :: String -> (String, [Int]) -> [(String, [Int])] -> [(String, [Int])]
fm2 m (s, i) l
  | m /= s = [(s, i)] ++ l
  | otherwise = l

invertedHelper :: [(Int, [String])] -> [(String, [Int])]
invertedHelper l = invertedHelper2 (foldr (iH1_1) [] l)

iH1_1 :: (Int, [String]) -> [(String, Int)] -> [(String, Int)]
iH1_1 (v, s) l = foldr (iH1_2 v) l s

iH1_2 :: Int -> String -> [(String, Int)] -> [(String, Int)]
iH1_2 v s l = [(s, v)] ++ l

invertedHelper2 :: [(String, Int)] -> [(String, [Int])]
invertedHelper2 x = foldr (iH2_1) [] x

iH2_1 :: (String, Int) -> [(String, [Int])] -> [(String, [Int])]
iH2_1 (s, v) l = [(s, (foldr (iH2_2 s) [v] l))] ++ l

iH2_2 :: String -> (String, [Int]) -> [Int] -> [Int]
iH2_2 m (s, v) x
  | m == s = x ++ v
  | otherwise = x

{-
filterNums :: [[Int]] -> [[Int]]
filterNums l = foldr (f1) [] l --a: [Int] b: [[Int]]

f1 :: [Int] -> [[Int]] -> [[Int]]
f1 l ls = [(foldr (filterer) [] l)] ++ ls --a: Int b: [[Int]]

filterer :: Int -> [Int] -> [Int]
filterer v l = [v] ++ (filter (/= v) l)

--iH1_1 (v, s) l = foldr (iH1_2) l [(v, s)]
--iH1_1 (v, (s:ss)) l = (s, v) : l

--iH1_2 :: (Int, [String]) -> [(String, Int)] -> [(String, Int)]
--iH1_2 (x, (s:ss)) l = [(s, x)] ++ l --error lies here, needs to add rest of list

iH1_1 :: (Int, [String]) -> [(String, Int)] -> [(String, Int)]
iH1_1 (v, s) l = foldr (iH1_2 v) l [(v, s)]
--iH1_1 (v, (s:ss)) l = (s, v) : l

iH1_2 :: Int -> (Int, [String]) -> [(String, Int)] -> [(String, Int)]
iH1_2 v (x, (s:ss)) l = [(s, v)]

notIncluded :: String -> [(String, [Int])] -> Bool
notIncluded s l = True
--foldr (nIH s) True l

nIH :: String -> (String, [Int]) -> Bool -> Bool
nIH m (s, l) b
  | m == s = False
  | otherwise = True
-}

--Question 4

sieve :: [Int]
sieve = foldr addToList (zoomUp 2) (zoomUp 2)


zoomUp :: Int -> [Int]
zoomUp x = x:zoomUp(x+1)

addToList :: Int -> [Int] -> [Int]
addToList item list = item : filter (isNotMultipleOf item) list

isMultipleOf :: Int -> Int -> Bool
isMultipleOf x y
    |mod y x == 0 = True
    |otherwise = False
    
isNotMultipleOf :: Int -> Int -> Bool
isNotMultipleOf x y = not (isMultipleOf x y)

--Question 5

test :: Int -> (Int, Stack Int)
test x = pop (push (x+1) (push x Empty))

test2 :: Int -> Stack Int
test2 x = (push x (push (x+1) Empty))

test3 :: Int -> (Int, Stack Int)
test3 x = top (push x Empty)

test4 :: [a] -> Stack a
test4 l = stackify l

test5 :: [a] -> [a]
test5 s = flatten (stackify s)




remdups :: [Int] -> [Int] -> [Int]
remdups x y = helper x y []

helper :: [Int] -> [Int] -> [Int] -> [Int]
helper [] [] b = reverse b
helper (x:xs) (y:ys) b
    | x /= y = helper xs ys (x:b)
    | otherwise = helper xs ys b