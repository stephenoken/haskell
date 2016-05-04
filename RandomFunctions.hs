module MyListFunctions
    (
    slice
    ) where

  slice :: Int -> Int -> [a] -> [a]
  slice from to xs = take (to - from +1 )(drop from xs)
