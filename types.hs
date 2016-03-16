--Types 
--Haksell uses Type inferences 
-- :t 'a'
-- :t "Hello !"
-- :t (True, 'a')
-- :t 4 == 5
-- You can give explict type declarations to functions
-- Generally a good idea when the functions are short
removeNonUppercase :: String -> String
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int -- The return type is always at the end
addThree x y z = x + y + z
-- Integer
factorial :: Integer -> Integer
factorial n = product [1..n]
-- Float 
circumfrenece :: Float -> Float
circumfrenece r = 2 * pi * r
-- Double 
circumfrenece' :: Double -> Double
circumfrenece' r = 2 * pi * r
-- Type Variables
-- :t head --> head :: [a] -> a
-- a is a type variable and as a result can be of any type 
-- Show 
-- show 3 
-- show True
-- Read
-- read "True" || False
-- read "8.2" + 3.8
-- read "5" - 2
-- read "[1,2,3,4,5,6]" ++ [3]
-- (read "5" :: Float) * 4 -- a way of exlicty telling what type to read the string as
-- Enum
-- [LT..GT]
-- succ 'B'
-- Bounded
-- minBound :: Int
-- maxBound :: Char
-- maxBound :: Bool
-- => means everything beofre it is a class constraint for example the == function is:
-- (Eq a) => a -> a -> Bool  meaning that the two paramters must be of the same type 
-- 
