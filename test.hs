fib :: Integer -> Integer
fib n = fibo n 0 1
fibo :: Integer -> Integer -> Integer -> Integer

fibo n a b
	| n == 0 = a 
	|otherwise = fibo(n-1) b (a+b)
