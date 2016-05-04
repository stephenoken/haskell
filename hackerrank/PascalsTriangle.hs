-- module Main where

-- pascalTriangle :: Int -> [(Int,Int)]
-- pascalTriangle k = [(n,r) | n <- [1..k], r <- [1..k]]

-- factorial :: (Integral a) => a-> a
-- factorial 0 = 1
-- -- factorial n = n * 1
-- factorial n = n * factorial (n-1)

-- factorial :: (Integral a) => a-> a
-- factorial n
--   | n <= 0 = 1
--   | otherwise = n * factorial (n-1)
-- binomialCoefficients :: (Integral a) => a -> a -> a
-- binomialCoefficients n r = factorial n `div` (factorial r * factorial(n-r))
--


-- main :: IO ()
-- main = do
--   k <- readLn :: IO Int
--   putStrLn (pascalTriangle k)
