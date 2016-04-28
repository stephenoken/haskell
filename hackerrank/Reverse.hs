module Main where

main :: IO ()
main = do
  line <- getLine
  putStrLn (rev line)

rev :: [a]->[a]
rev [] = []
rev (x:xs) = rev xs ++ [x]
