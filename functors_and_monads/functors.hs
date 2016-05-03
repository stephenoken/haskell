-- module Main where
import Data.Char
import Data.List
-- Functors are things that can be mapped over,
-- like lists, Maybes, trees, and such.
-- main = do
--   line <- getLine
--   let line' = reverse line
--   putStrLn $ "You said " ++ line' ++ " backwards!"
--   putStrLn $ "Yes, you really said " ++ line' ++ " backwards!"

-- can be represetned using functors as
-- main = do
--   line <- fmap reverse getLine
--   putStrLn $ "You said " ++ line ++ " backwards!"
--   putStrLn $ "Yes, you really said " ++ line ++ " backwards!"

main :: IO ()
main = do
  line <- fmap (intersperse '-' . reverse . map toUpper) getLine
  putStrLn line
