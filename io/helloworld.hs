-- module Main where
-- import Data.Char
--
-- main :: IO ()
-- main = do
--   putStrLn "Hello What is your name?"
--   -- The <- will bind the result as a string
--   -- = will simply give getLine a new name
--   name <- getLine
--   putStrLn ("Hey "++name++", you rock!!")
--   putStrLn "What is your first name"
--   firstName <- getLine
--   putStrLn "What is your last name"
--   lastName <- getLine
--   let
--     bigFirstName = map toUpper firstName
--     bigLastName = map toUpper lastName
--     in
--       putStrLn $ "Hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"


-- Next example

-- module Main where
--
-- main :: IO ()
-- main = do
--   line <- getLine
--   if null line
--     then return ()
--     else (do
--       putStrLn (reverseWords line)
--       main)
--
-- reverseWords :: String -> String
-- reverseWords = unwords . map reverse . words


-- Return doesn't act like the return in other imperitive languages, instead
-- it makes an I/O action out of a pure value
-- main = do
--     return ()
--     return "HAHAHA"
--     line <- getLine
--     return "BLAH BLAH BLAH"
--     return 4
--     putStrLn line

-- main = do
--     a <- return "hell"
--     b <- return "yeah!"
--     putStrLn $ a ++ " " ++ b

-- same as

-- main = do
--   let
--     a = "hell"
--     b = "yeah"
--     in
--       putStrLn $ a ++ " " ++ b

-- Monads
-- import Control.Monad
--
-- main :: IO ()
-- main = do
--     c <- getLine
--     putStrLn (unwords (replicate' 5 c))
--     rs <- sequence (replicate 3 getLine)
--     print rs
--     main
--
-- replicate' :: (Num i, Ord i) => i -> a -> [a]
-- replicate' n x
--   | n <=0 = []
--   | otherwise = x:replicate' (n-1) x


-- mapM print [1,2,3
-- 1
-- 2
-- 3
-- [(),(),()]
-- mapM_ print [1,2,3]
-- 1
-- 2
-- 3

-- Run Forver
-- module Main where
-- import Control.Monad
-- import Data.Char
--
-- main :: IO ()
-- main = forever $ do
--   putStr "Give me some input :"
--   l <- getLine
--   putStrLn $ map toUpper l
--
-- module Main where
-- import Control.Monad
--
-- main :: IO ()
-- main = do
--   colours <- forM [1,2,3,4] (\a -> do
--     putStrLn $ "Which colour do you associate with the number " ++ show a ++ "?"
--     colour <- getLine
--     return colour)
--   putStrLn "The colours that you associated with 1..4 are :  "
--   mapM putStrLn colours
