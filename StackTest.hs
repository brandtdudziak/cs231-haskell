import StackModule

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

{-
sort :: Ord a => [a] -> [a]
sort l = foldr (sortHelper) l l

sortHelper :: Ord a => a -> [a] -> [a]
sortHelper v l = (filter (< v) l) ++ (filter (>= v) l)
-}