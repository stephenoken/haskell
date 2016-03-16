lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of range"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe x = "Not between 1 and 2"

-- Note that the catch 0 = 1 means that the recursion ends there 
-- This is an example of a catch 
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial(n-1)
-- Non pattern way of adding vectors
addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
-- addVectors a b = (fst a + fst b, snd a + snd b) 
-- Using the pattern way 
addVectors (x1,y1)(x2,y2) = (x1 + x2, y1 +y2)

-- fst and snd for 3 tuples
first :: (a,b,c) -> a
first (x,_,_) = x
second :: (a,b,c) -> b
second (_,y,_) = y
third :: (a,b,c) -> c
third (_,_,z) = z
-- let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)] 
listComp xs = [a+b| (a,b) <- xs]

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
-- tell (x:[]) = "The list has one element: " ++ show x
tell ([x]) = "The list has one element: " ++ show x
-- tell (x:y:[]) = "The list has two  elements: " ++ show x ++ " and " ++ show y
tell (x:[y]) = "The list has two  elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "The list has more than two elements the first two are : " ++ show x ++ " and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs 

-- sum' :: (Num a) => [a] -> a
-- sum' [] = 0
-- sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty String !"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
-- Guards
-- A way to test the properties of a value(s) are ture or false 
--bmiTell :: (RealFloat a) => a -> String 
--bmiTell bmi
--	|bmi <= 18.5 = "You're underweight, you emo!"
--	|bmi <= 25.0 = "You're supposedly normal, you must be ugly"
--	|bmi <= 30.0 = "You're fat! Lose some weight, fatty" 
--	|otherwise = "You're a whale, congradualtions"
--bmiTell :: (RealFloat a) => a->a->String
--bmiTell weight height
--	| weight / height ^2 <= 18.5= "You're underweight, you emo!"
--	| weight / height ^2 <= 25.0= "You're supposedly normal, you must be ugly"
--	| weight / height ^2 <= 30.0= "You're fat! Lose some weight, fatty"
--	| otherwise = "You're a whale, congradualtions"
max' :: (Ord a) => a -> a -> a
max' a b 
	| a > b = a
	| otherwise = b

myCompare :: (Ord a) => a -> a-> Ordering
a `myCompare` b
	| a > b = GT
	| a == b = EQ
	|otherwise = LT

-- Where cluase, stops us from repeating ourselves 
--bmiTell :: (RealFloat a) => a->a->String
--bmiTell weight height
--	| bmi <= skinny= "You're underbmi, you emo!"
--	| bmi <= normal= "You're supposedly normal, you must be ugly"
--	| bmi <= fat= "You're fat! Lose some bmi, fatty"
--	| otherwise = "You're a whale, congradualtions"
--	where bmi = weight/height ^2 (skinny,normal,fat) = (18.5,25.0,30.0)

--cylinder :: (RealFloat a) => a -> a -> a 
--cylinder r h =
--	let sideArea  = 2 * pi * r * h
	--		topArea = pi * r ^ 2
	--in sideArea + 2 * topArea

-- [if 5>3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]
-- Note that the next two constructs do the samething
-- 4 * (if 10 > 5 then 10 else 0) + 2
-- 4 * (let a = 9 in a +1)+2
-- (let a=100; b=200; c=300 in a*b*c, let foo="Hey"; bar=" there!" in foo++bar)
-- (let (a,b,c) = (1,2,3) in a+b+c)*100
calcBmis :: (RealFloat a) => [(a,a)] -> [a]
calcBmis xs = [bmi | (w,h) <- xs, let bmi=w/h^2,bmi >= 25]

-- [let square x = x * x in (square 5, square 3, square 2)]

-- Cases
-- Pattern matching example 
--head' ::[a] -> a
--head' [] = error "No head for empty lists!"
--head'(x:_) = x
--Same result using case
--head' ::[a] -> a
--head' xs = case xs of [] -> error "No head of empty list" 
--(x:_) -> x
descirbeList ::[a] -> String 
descirbeList xs = "This list is " ++ what xs 
	where what[] = "empty."
		what[x] = "a singleton list."
				what xs = "a longer list."
