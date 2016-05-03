-- fib :: Integer -> Integer
-- fib n = fibo n 0 1
-- fibo :: Integer -> Integer -> Integer -> Integer
--
-- fibo n a b
-- 	| n == 0 = a
-- 	|otherwise =
-- 		fibo(n-1) b (a+b)

fibs :: [Int]
fibs = 0 : 1 : zipWith (\ x y -> (x+y)^3) fibs (tail fibs)
-- What is happening here is that we are recursively zipping the fibs and the
-- tail of fibs and then adding them togeather. Since the first two numbers are edge
-- cases we manually implement them after that we continue on with fib sequence
-- fibs = 0 : 1: zipWith (+) fibs (tail fibs)

cubed :: Num a => a -> a
cubed x = x*x*x

--map (cubed) (take 10 fibs)

-- find the number occurances of a single character
quicksort :: (Ord a, Eq a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = let
  smallerSorted = quicksort [a | a <- xs, a <= x]
  biggerSorted = quicksort [a | a <- xs, a > x]
  in smallerSorted ++ [x] ++ biggerSorted

unique :: (Eq a) => [a] -> [a]
unique = foldl (\ seen x -> if x `elem` seen then seen else seen ++ [x]) []

countAll :: Eq a => [a] -> [a] -> [(a,Int)]
countAll values = map (\x-> (x,length $ filter (\y-> x == y) values))

count :: Eq a => [a] -> a -> (a,Int)
count values key= (key,length $ filter(\y -> key == y) values)

getKeys :: (Ord a, Eq a) => [a] -> [a]
getKeys k = unique $ quicksort k
-- countAll t . unique $ quicksort t
--
-- or
--
-- countAll t $ getKeys t
