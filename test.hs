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
-- fibs = 0 : 1: zipWith (+) fibs (tail fibs)

cubed :: Num a => a -> a
cubed x = x*x*x

--map (cubed) (take 10 fibs)
