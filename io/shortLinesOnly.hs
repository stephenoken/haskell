-- module Main where
--
-- main :: IO ()
-- main = do
--   contents <- getContents
--   putStr (shortLinesOnly contents)
--


-- Can be replaced by interatc

shortLinesOnly :: String -> String
shortLinesOnly input =
  let
  allLines = lines input
  shortlLines = filter(\l -> length l <10) allLines
  result = unlines shortlLines
  in result


main :: IO ()
main = interact shortLinesOnly
