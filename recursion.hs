module Recurision where

max' :: (Ord a) => [a] -> a
max' [] = error "maximum of empty list"
max' [x] = x
max' (x:xs)
	| x > maxTail = x
	|otherwise = maxTail
	where maxTail = max' xs

max2' ::(Ord a) => [a] -> a
max2' [] = error "maximum of empty list"
max2' [x] = x
max2' (x:xs) = min x (max2' xs) --I made this to find the min
-- Note that we can use pattern matching to make recursion much cleaner than JS or C++

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
	| n <=0 = []
	| otherwise = x:replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
	| n <= 0 =[]
take' _ [] = []
take' n (x:xs) = x: take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x:repeat' x
--Infinite list function
--You can use take 5 (repeat'3)

zip' :: [a] -> [b] ->[(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys
--zip' [1,2,3,4,5,6,7,8,9] [7,5,3,6,2]

sum' :: Num t => [t] -> t
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- quicksort ::(Ord a) => [a] -> [a]
-- quicksort [] = []
-- quicksort (x:xs) =
-- 	let smallerSorted = quicksort [a | a <- xs, a <= x]
-- 		biggerSorted = quicksort [a | a <- xs , a > x]
-- 	in smallerSorted ++ [x] ++ biggerSorted
