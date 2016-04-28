module Main where
len :: [a] -> Int
len (_:ls) = 1 + len ls
len _ = 0

main :: IO ()
main = putStrLn "Hello World"
