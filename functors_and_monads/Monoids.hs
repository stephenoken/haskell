-- class Monoid m where
--   mempty :: module Main where
--   mappend :: m -> m->->m
--   mconcat :: [m] -> m
--   mconcat = foldr mappend mempty
--

  -- lists are monoids 😱


-- ghci> [1,2,3] `mappend` [4,5,6]
-- [1,2,3,4,5,6]
-- ghci> ("one" `mappend` "two") `mappend` "tree"
-- "onetwotree"
-- ghci> "one" `mappend` ("two" `mappend` "tree")
-- "onetwotree"
-- ghci> "one" `mappend` "two" `mappend` "tree"
-- "onetwotree"
-- ghci> "pang" `mappend` mempty
-- "pang"
-- ghci> mconcat [[1,2],[3,6],[9]]
-- [1,2,3,6,9]
-- ghci> mempty :: [a]
-- []

-- We already examined one way for numbers to be considered monoids. Just have the
-- binary function be * and the identity value 1
-- the binary function be + and the identity value 0

-- The monoid laws hold, because if you add 0 to any number, the result is that
-- number. And addition is also associative, so we get no problems there.

-- Monoids have product and sum
-- can be imported from Data.Monoid
import Data.Monoid
import qualified Foldable as F
-- ghci> getProduct $ Product 3 `mappend` Product 9
-- 27
-- ghci> getProduct $ Product 3 `mappend` mempty
-- 3
-- ghci> getProduct $ Product 3 `mappend` Product 4 `mappend` Product 2
-- 24
-- ghci> getProduct . mconcat . map Product $ [3,4,2]
-- 24

-- ghci> getSum $ Sum 2 `mappend` Sum 9
-- 11
-- ghci> getSum $ mempty `mappend` Sum 3
-- 3
-- ghci> getSum . mconcat . map Sum $ [1,2,3]
-- 6

-- The or opperator is a monoid known as any

-- ghci> getAny $ Any True `mappend` Any False
-- True
-- ghci> getAny $ mempty `mappend` Any True
-- True
-- ghci> getAny . mconcat . map Any $ [False, False, False, True]
-- True
-- ghci> getAny $ mempty `mappend` mempty
-- False

-- The and operator is All
ors = if (True || False) then show("Yeah") else show("Naw")
ands = if (True && False) then show("Yeah") else show("Naw")


-- Ordering is a monoid

-- Using the `mappend` we can use ordering to determine ythe order based on the first compare and
-- and if it's equal it will move onto the next one
-- OK, so how is this monoid useful?
-- Let's say you were writing a function that takes two
-- strings, compares their lengths, and returns an
-- Ordering. But if the strings are of the same length, then
-- instead of returning EQ right away, we want to compare them
-- alphabetically. One way to write this would be like so:

-- lengthCompare :: String -> String -> Ordering
-- lengthCompare x y = let a = length x `compare` length y
-- b = x `compare` y
-- in  if a == EQ then b else a

-- can be represented as follows using monoids

lengthCompare:: String -> String -> Ordering
-- lengthCompare x y = (length x `compare` length y) `mappend` (x `compare` y)
lengthCompare x y = (length x `compare` length y) `mappend`
                    (vowels x `compare` vowels y) `mappend`
                    (x `compare` y)
      where vowels = length . filter(`elem`"aeoiu")

-- The Ordering monoid is very cool because it allows us to easily
-- compare things by many different criteria and put those
-- criteria in an order themselves, ranging from the most
-- important to the least.


-- Because there are so many data structures that work nicely with folds, the
-- Foldable type class was introduced.

-- ghci> :t foldr
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- ghci> :t F.foldr
-- F.foldr :: (F.Foldable t) => (a -> b -> b) -> b -> t a -> b

-- ghci> foldr (*) 1 [1,2,3]
-- 6
-- ghci> F.foldr (*) 1 [1,2,3]
-- 6

-- ghci> F.foldl (+) 2 (Just 9)
-- 11
-- ghci> F.foldr (||) False (Just True)
-- True


-- Continue from : Using monoids to fold data structures
