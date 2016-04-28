module Main where

import Data.Char

panagram :: String -> String
panagram xs = let
  result = map toLower (filter (/=' ') xs)
  in if

quickSort :: (Ord a)=> [a]-> [a]
quickSort [] = []
quickSort (x:xs) = let
  smallSort = quickSort [a | a<-xs, a <=x]
  bigSort = quickSort [a | a<-xs, a > x]
  in smallSort ++ [x] ++ bigSort

main :: IO ()
main = do
  contents <- getLine
  putStrLn (quickSort "hello")
  putStrLn(panagram contents)
