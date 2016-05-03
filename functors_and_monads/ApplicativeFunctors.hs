-- fmap (++) (Just "Hey")

-- Functors within functors
-- ghci> let a = fmap (*) [1,2,3,4]
-- ghci> :t a
-- a :: [Integer -> Integer]
-- ghci> fmap (\f -> f 9) a
-- [9,18,27,36]

-- We can't extract a function out of a Nothing,
-- because it has no function inside it. So we
-- say that if we try to extract a function from a
-- Nothing, the result is a Nothing. If you look
-- at the class definition for Applicative, you'll
-- see that there's a Functor class constraint, which
-- means that we can assume that both of <*>'s
-- parameters are functors.

-- ghci> Just (+3) <*> Just 9
-- Just 12
-- ghci> pure (+3) <*> Just 10
-- Just 13
-- ghci> pure (+3) <*> Just 9
-- Just 12
-- ghci> Just (++"hahah") <*> Nothing
-- Nothing
-- ghci> Nothing <*> Just "woot"
-- Nothing


-- (++) <$> Just "johntra" <*> Just "volta"
-- Just "johntravolta"
--
-- ghci> (++) "johntra" "volta"
-- "johntravolta"

-- Some super fucked up list comprehensions
-- [(*0),(+100),(^2)] <*> [1,2,3]
-- [0,0,0,101,102,103,1,4,9]

-- [(+),(*)] <*> [1,2] <*> [3,4]
-- [4,5,5,6,3,4,6,8]

-- This : [ x*y | x <- [2,5,10], y <- [8,10,11]]
-- Can be represented in applicative manner as:
-- (*) <$> [2,5,10] <*> [8,10,11]

-- filter (>50) $ (*) <$> [2,5,10] <*> [8,10,11]
-- [55,80,100,110]

-- myAction :: IO String
-- myAction = do
--     a <- getLine
--     b <- getLine
--     return $ a ++ b

-- myAction :: IO String
-- myAction = (++) <$> getLine <*> getLine

-- main = do
--     a <- (++) <$> getLine <*> getLine
--     putStrLn $ "The two lines concatenated turn out to be: " ++ a

-- (\x y z -> [x,y,z]) <$> (+3) <*> (*2) <*> (/2) $ 5
-- [8.0,10.0,2.5]

-- import Control.Applicative
-- getZipList $ (+) <$> ZipList [1..3] <*> ZipList [100,100,100]
-- getZipList $ (+) <$> ZipList [1,2,3] <*> ZipList [100,100..]
-- getZipList $ max <$> ZipList [1,2,3,4,5,3] <*> ZipList [5,3,1,2]
-- getZipList $ (,,) <$> ZipList "dog" <*> ZipList "cat" <*> ZipList "rat"
-- The (,,) function is the same as \x y z -> (x,y,z). Also, the (,) function is the same as \x y -> (x,y).





-- Type vs newType vs data
-- The type keyword is for making type synonyms.
-- type IntList = [Int]

-- The newtype keyword is for taking existing types and wrapping them in new types, mostly so that it's easier to
-- make them instances of certain type classes.
-- newtype CharList = CharList { getCharList :: [Char] }

-- The data keyword is for making your own data types and with them, you can go hog wild]
