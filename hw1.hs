intToStr :: Int -> String
intToStr n
  | n > 0 = "positive"
  | n < 0 = "negative"
  | otherwise = "zero"

recur :: [Int] -> [String]
recur [] = []
recur (x:xs) = (( intToStr x ) : recur xs )

mapf :: [Int] -> [String]
mapf x = map intToStr x

times :: [Int] -> Int
times [] = 1
times (x:xs) = x * times(xs)

times1 :: [Int] -> Int
times1 (x:xs) = timesHelp x xs

timesHelp :: Int -> [Int] -> Int
timesHelp a [] = a
timesHelp a (x:xs) = timesHelp (a*x) (xs)

times2 :: [Int] -> Int
times2 (x:xs) = foldr (*) x xs

ziptest :: [Int] -> [(Int, Int)]
ziptest l = zip l (tail l)
