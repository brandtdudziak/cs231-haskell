--a stack
module StackModule where

data Stack a = Empty | a `Cons` (Stack a)      --a : Stack a

push :: a -> Stack a -> Stack a
push a as = Cons a (as)

pop :: Stack a -> (a, Stack a)
pop Empty = error "Stack.pop: Empty"
pop (Cons x (xs)) = (x, xs)

top :: Stack a -> (a, Stack a)
top Empty = error "Stack.top: Empty"
top (Cons x (xs)) = (x, (push x xs))


stackify :: [a] -> Stack a
stackify l = foldl (stackifyHelper) Empty l

stackifyHelper :: Stack a -> a -> Stack a
stackifyHelper s v = push v s


flatten :: Stack a -> [a]
flatten s = flattenHelper (pop s)

flattenHelper :: (a, Stack a) -> [a]
flattenHelper (v, Empty) = [v]
flattenHelper (v, s) = v : flattenHelper (pop s)


instance Show a => Show (Stack a) where
  show Empty = "[Bottom]"
  show (Cons v s) = show s ++ " <- [" ++ show v ++ "]"
  
  
  --alternative Show instance
  {-
  instance Show a => Show (Stack a) where
  show Empty = "[Empty]"
  show (Cons v s) = "[" ++ show v ++ " " ++ show s
  -}