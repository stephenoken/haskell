module Main where

import System.IO
import Data.Char
main :: IO ()
-- main = do
--   handle <- openFile "girlfriend.txt" ReadMode
--   contents <- hGetContents handle
--   putStrLn contents
--   hClose handle

--Alternatove

-- main = do
--   withFile "girlfriend.txt" ReadMode (\handle -> do
--     contents <- hGetContents handle
--     putStr contents)

-- Or

-- main = do
--   contents <- readFile "girlfriend.txt"
--   putStr contents


-- Write a new file
-- main = do
--   contents <- readFile "girlfriend.txt"
--   writeFile "girlfriendCAPS.txt" (map toUpper contents)

-- Append File
main = do
  todoItem <- getLine
  appendFile "todo.txt" (todoItem ++ "\n")


  -- Look up this for command line args http://learnyouahaskell.com/input-and-output
