-- Read file
-- Run `cat haiku.txt| ./capslocker` or `./capslocker`
module Main where
import Data.Char

main :: IO ()
main = do
  contents <- getContents
  putStr (map toUpper contents)
