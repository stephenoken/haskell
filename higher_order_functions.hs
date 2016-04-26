multThree  :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z
-- let multTwoWithNine = multThree 9
-- multTwoWithNine 2 3
-- let multWithEighteen = multTwoWithNine 2
-- multWithEighteen 10
-- takes a number and compares it to 100
compareWithHundred :: (Num a, Ord a) => a -> Ordering
-- compareWithHundred x = compare 100 x
-- Cna be rewritten as such
compareWithHundred = compare 100

-- Infix functions can also be partially applied by using sections.
-- To section an infix function, simply surround it with parentheses and
-- only supply a parameter on one side. That creates a function that
-- takes one parameter and then applies it to the side that's missing an operand.
dividedByTen :: (Floating a) => a ->a
dividedByTen = (/10)

--Can't use `-` as it means negative number, use subtract
subtractByFour :: (Floating a) => a -> a
subtractByFour = subtract 4

applyTwice :: (a ->a) -> a -> a
applyTwice f x = f (f x)
-- applyTwice (+3) 10
-- applyTwice (3:) [1]

zipWith' :: (a->b->c) ->[a] ->[b] ->[c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- zipWith' (+) [4,2,5,6] [2,6,2,3]
-- zipWith' max [6,3,2,1] [7,3,1,5]
-- zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]
-- zipWith' (*) (replicate 5 2) [1..]
-- zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]

flip' :: (a->b->c) -> (b->a->c)
flip' f = g
  where g x y = f y x
-- Alternative way
-- flip' f y x = f x y

-- Maps

map' ::(a->b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x :map' f xs

-- divide x = (/x)
-- map (divide 2) [10,8,6,4,2]
-- [5.0,4.0,3.0,2.0,1.0]

filter' :: (a -> Bool) -> [a] ->[a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x: filter' p xs
  | otherwise = filter' p xs

-- filter (>3) [1,5,3,4,79,0,2,5,678,2]
-- Both map and filter can be done via list comprehensions
-- let filter = [x|x <- [1,5,3,4,79,0,2,5,678,2], x>3]

--Quick sort
-- quicksort :: (Ord a) => [a] -> [a]
-- quicksort [] =[]
-- quicksort (x:xs) =
--   let smallerSorted = quicksort (filter (<= x) xs)
--     biggerSorted = quicksort(filter(>x)xs)
--   in smallerSorted ++ [x] ++ biggerSorted

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

something = head (filter p [100000,99999..])
  where
    p x = x == 3

-- Start from left to right
sumOfAllOddSquaredNumbersSmallerThan x = sum (takeWhile (<x)(filter odd(map(^2)[1..])))
--Same function done using list comprehensions
sumOfAllOddSquaredNumbersSmallerThan2 x = sum (takeWhile (<x) [n^2 | n <- [1..], odd (n^2)])
--Collatz sequences. We take a natural number. If that number is even, we divide it by two.
--If it's odd, we multiply it by 3 and then add 1 to that. We take the resulting number and
--apply the same thing to it, which produces a new number and so on.
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd n = n:chain (n*3 +1)

  --For all starting numbers between 1 and 100, how many chains have a length greater than 15
longChains :: Int
longChains = length(filter isLong (map chain [1..100]))
  where isLong xs = length xs > 15

-- Lambdas
longChains2 = length(filter (\xs -> length xs >15)(map chain [1..100]))

--zipWith (\a b -> (a * 30 +3) /b) [1,2,3,4,5] [5,4,3,2,1]

addThree :: (Num a) => a ->a -> a -> a
-- addThree x y z = x+y+z
addThree = \x -> \y -> \z -> x+y+z

flip2 :: (a-> b-> c) -> b -> a -> c
flip2 f = \x y -> f y x

--Folds aka reduce
sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs
-- sum' = foldl (\acc x -> acc + x) 0
sum' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool
elem' y = foldl(\acc x ->  if x == y then True else acc) False

map2' :: (a -> b) -> [a] -> [b]
map2' f = foldr(\x acc -> f x :acc)[]

-- foldr1 are like foldl except they don't need an explicit starting value
max' :: (Ord a) => [a] -> a
max' =  foldl1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter2' :: (a -> Bool) -> [a] -> [a]
filter2' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- scanl and scanr are like foldl and foldr, only they report all
-- the intermediate accumulator states in the form of a list.
-- scanl (+) 0 [3,5,2,1]
-- [0,3,8,10,11]
-- scanr (+) 0 [3,5,2,1]
-- [11,8,3,1,0]
-- scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
-- [3,4,5,5,7,9,9,9]
-- scanl (flip (:)) [] [3,2,1]
-- [[],[3],[2,3],[1,2,3]]

-- How many elements does it take for the sum of the roots of all natural
-- numbers to exceed 1000?
sqrtSums :: Int
sqrtSums = length(takeWhile (<1000) (scanl1 (+) (map sqrt [1..])))+1

-- $ function application
--Hasd low precedence can allow us to remove some of the paranthesis
($) :: (a->b) -> a -> b
f $ x = f x

-- sum (map sqrt [1..130])
-- sum $ map sqrt [1..130]

-- $ means that function application can be treated just like another function
-- mapOverListOfFunctions = map ($ 3) [(4+),(10*),(^2),sqrt]

-- Function composition
-- composing two functions produces a new function that, when called with
 -- a parameter, say, x is the equivalent of calling g with the parameter x and
 --  then calling the f with that result.

-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g = \x -> f (g x)

-- One of the uses for function composition is making functions on the fly to
-- pass to other functions. Sure, can use lambdas for that, but many times, function
-- composition is clearer and more concise. Say we have a list of numbers and we want
-- to turn them all into negative numbers.

-- These examples use onl 1 parameter

negate1 ::  [Double] -> [Double]
negate1 = map (\x -> negate (abs x))
-- can be written as
negate2 ::  [Double] -> [Double]
negate2 = map (negate . abs)

-- map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
-- [-14,-15,-27]
-- map (negate . sum . tail) [[1..5],[3..6],[1..7]]
-- [-14,-15,-27]


oddSquareSum :: Integer
oddSquareSum = sum(takeWhile (<1000) (filter odd (map (^2) [1..])))
-- oddSquareSum = sum . takeWhile (<1000) . filter odd . map (^2) $ [1..]
