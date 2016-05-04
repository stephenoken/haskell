import Control.Monad
-- monads are nothing more than beefed up applicativs

-- ghci> fmap (++"!") (Just "wisdom")
-- Just "wisdom!"
-- ghci> fmap (++"!") Nothing
-- Nothing

-- Nothing is a way for haskell to have nill
-- ghci> Just (+3) <*> Just 3
-- Just 6
-- ghci> Nothing <*> Just "greed"
-- Nothing
-- ghci> Just ord <*> Nothing
-- Nothing

-- ghci> max <$> Just 3 <*> Just 6
-- Just 6
-- ghci> max <$> Just 3 <*> Nothing
-- Nothing

-- >>= takes a monadic value, and a function that takes a normal value and returns
-- a monadic value and manages to apply that function to the monadic value.

-- ghci> (\x -> Just (x+1)) 1
-- Just 2
-- ghci> (\x -> Just (x+1)) 100
-- Just 101

-- f stands for Functor
-- same as >>=
applyMaybe :: Maybe a ->(a-> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

-- Okay, now let's play with it for a bit. We'll use it as an infix function so
-- that the Maybe value is on the left side and the function on the right:
--
-- ghci> Just 3 `applyMaybe` \x -> Just (x+1)
-- Just 4
-- ghci> Just "smile" `applyMaybe` \x -> Just (x ++ " :)")
-- Just "smile :)"
-- ghci> Nothing `applyMaybe` \x -> Just (x+1)
-- Nothing
-- ghci> Nothing `applyMaybe` \x -> Just (x ++ " :)")
-- Nothing


-- What about if the function returns a Nothing?
-- ghci> Just 3 `applyMaybe` \x -> if x > 2 then Just x else Nothing
-- Just 3
-- ghci> Just 1 `applyMaybe` \x -> if x > 2 then Just x else Nothing
-- Nothing

-- return is the same as pure, so that one's a no-brainer. We do what we
-- did in the Applicative type class and wrap it in a Just.

-- ghci> return "WHAT" :: Maybe String
-- Just "WHAT"
-- ghci> Just 9 >>= \x -> return (x*10)
-- Just 90
-- ghci> Nothing >>= \x -> return (x*10)
-- Nothing

-- Walk the line

type Birds = Int
type Pole = (Birds,Birds)

-- landLeft:: Birds -> Pole -> Pole
-- landLeft n (left,right) = (left+n, right)
-- landRight:: Birds -> Pole -> Pole
-- landRight n (left,right) = (left, right+n)

-- hci> landLeft 2 (0,0)
-- (2,0)
-- ghci> landRight 1 (1,2)
-- (1,3)
-- ghci> landRight (-1) (1,2)
-- (1,1)
-- ghci> landLeft 2 (landRight 1 (landLeft 1 (0,0)))

-- Wouldn't it be better to write the parameter first, then the function
x -: f = f x

-- ghci> 100 -: (*3)
-- 300
-- ghci> True -: not
-- False
-- ghci> (0,0) -: landLeft 2
-- (2,0)
-- (0,0) -: landLeft 1 -: landRight 1 -: landLeft 2

landLeft:: Birds -> Pole -> Maybe Pole
landLeft n (left,right)
  | abs ((left+n) -right) <4 = Just (left + n , right)
  | otherwise = Nothing
landRight:: Birds -> Pole -> Maybe Pole
landRight n (left,right)
  | abs (left - (right+n)) <4 = Just (left , right  + n)
  | otherwise = Nothing

-- The same as before excpet can returns a maybe
-- ghci> landLeft 2 (0,0)
-- Just (2,0)
-- ghci> landLeft 10 (0,3)
-- Nothing

-- Doesn't work as a maybe is returned
-- (0,0) -: landLeft 4 -: landRight 1

-- Now Monads are starting to make sense
-- we evaluate the expression on the left and feed it ot the expression on the right
-- ghci> landRight 1 (0,0) >>= landLeft 2
-- Just (2,1)

-- ghci> return (0,0) >>= landRight 2 >>= landLeft 2 >>= landRight 2
-- Just (2,4)

checkString:: String -> Maybe String
checkString x
  | length x >= 4  = Just x
  | otherwise = Nothing

appendString :: String -> Maybe String
appendString x = Just (x ++ " Whoop!")

-- The >>= allows you to unwrap a just as a normal variable
-- It basically fucking optionals from swift

-- ghci> (0,0) -: landLeft 1 -: landRight 4 -: landLeft (-1) -: landRight (-2)
-- (0,2)
-- Broken example

-- ghci> return (0,0) >>= landLeft 1 >>= landRight 4 >>= landLeft (-1) >>= landRight (-2)
-- Nothing

-- By unwrapping we overcome the constraints of Maybe types
 -- banana :: Pole -> Maybe Pole
 -- banana _ = Nothing
--  ghci> return (0,0) >>= landLeft 1 >>= banana >>= landRight 1
-- Nothing

-- ghci> Just 3 >>= (\x -> Just (show x ++ "!"))
-- Just "3!"

-- ghci> Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
-- Just "3!"

-- a nested use of >>=! In the outermost lambda, we feed Just "!" to the
-- lambda \y -> Just (show x ++ y)

-- ghci> let x = 3; y = "!" in show x ++ y
-- "3!"

-- ghci> Nothing >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
-- Nothing
-- ghci> Just 3 >>= (\x -> Nothing >>= (\y -> Just (show x ++ y)))
-- Nothing
-- ghci> Just 3 >>= (\x -> Just "!" >>= (\y -> Nothing))
-- Nothing


-- foo :: Maybe String
-- foo = Just 3 >>= (\x ->
--   Just "!" >>= (\y ->
--   Just (show x ++ y)))

-- We can remove the lambdas

foo :: Maybe Double
foo = do
  x <- Just 3
  y <- Just 4.0
  Just (x + y)

  -- We can use monads to unwrapp Justs

  -- ghci> Just 9 >>= (\x -> Just (x > 8))
  -- Just True

marySue :: Maybe Bool
marySue = do
    x <- Just 9
    Just (x > 8)

routine :: Maybe Pole
routine = do
  start <- return (0,0)
  first <- landLeft 2 start
  second <- landRight 2 first
  landLeft 1 second


justH :: Maybe Char
justH = do
    (x:xs) <- Just "hello"
    return x


-- list Monad

filteredList :: [Int]
filteredList = filter (<=300) ((*) <$> [1,2,3] <*> [10,100,1000])

-- ghci> [3,4,5] >>= \x -> [x,-x]
-- [3,-3,4,-4,5,-5]

-- [] is the equicliant of Nothing
-- ghci> [] >>= \x -> ["bad","mad","rad"]
-- []
-- ghci> [1,2,3] >>= \x -> []
-- []

-- like maybe we can chain monads togeather
-- ghci> [1,2] >>= \n -> ['a','b'] >>= \ch -> return (n,ch)
-- [(1,'a'),(1,'b'),(2,'a'),(2,'b')]

listOfTuples :: [(Int,Char)]
listOfTuples = do
    n <- [1,2]
    ch <- ['a','b']
    return (n,ch)

  -- ghci> [ x | x <- [1..50], '7' `elem` show x ]
  -- [7,17,27,37,47]

guard' :: (MonadPlus m) => Bool -> m ()
guard' True = return ()
guard' False = mzero

-- ghci> guard (5 > 2) :: Maybe ()
-- Just ()
-- ghci> guard (1 > 2) :: Maybe ()
-- Nothing
-- ghci> guard (5 > 2) :: [()]
-- [()]
-- ghci> guard (1 > 2) :: [()]
-- []

-- ghci> [1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)
-- [7,17,27,37,47]


-- ghci> guard (5 > 2) >> return "cool" :: [String]
-- ["cool"]
-- ghci> guard (1 > 2) >> return "cool" :: [String]
-- []

sevensOnly :: [Int]
sevensOnly = do
    x <- [1..50]
    guard ('7' `elem` show x)
    return x
