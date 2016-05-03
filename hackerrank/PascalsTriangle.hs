-- module Main where

-- pascalTriangle :: Int -> String
pascalTriangle k = [(n,r) | n <- [1..k], r <- [1..]]

factorial :: (Integral a) => a-> a
factorial 0 = 1
factorial n = n * factorial (n-1)

binomialCoefficients :: (Integral a) => a -> a -> a
binomialCoefficients n r = factorial n `div` (factorial r * factorial(n-r))
-- main :: IO ()
-- main = do
--   k <- readLn :: IO Int
--   putStrLn (pascalTriangle k)
