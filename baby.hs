doubleMe x = x+x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = (if x > 100 then x else x * 2) +1
conanOBrien = "It's me, Conan O'Brien" -- Functions cant start with uppercase characters
--Lists
lostNumbers = [4,8,15,16,23,42]
foundNumbers = lostNumbers ++ [doubleMe 42]
-- ++ are neot that efficient as haskell reads left to right
betterList = 5:foundNumbers
getTheSixthLetterOfString = conanOBrien !! 6

--Multidiemensional Lists
b = [[1,2,3],[4,3,3,4,5,5],[6,4,7,8,1]]
-- b ++ [[1,1,1,1]]
d = [6,6,6]
-- d:b
c = b!!2
-- Basic functions that operate on lists

--let h = head b
--let t = tail b
--let l = last b
--let i = init b -- Every element except the last
--length b
--null b -- checks if the list is empty returns true
e = take 2 b
f = reverse b
-- texas range
g = [1..100000]
h = ['a'..'z']
i = [2,4..20]
j = [3,6..20]
k = take 24 [13,26..] -- Lazy evalution
l = take 12 (cycle "LOL ")
m = replicate 100 5

-- List comprehension
-- We can do more complicated functions here instead of just finding doubling the first 1- numbers
-- [x*2 | x <- [1..10]]
--  [x | x <- [50..10], x `mod` 7 == 3]
-- boomBangs xs = [if x < 10 then "Boom!" else "Bang!" | x <- xs, odd x]
-- bommBangs [7..15]
-- [x|x <- [10..20], x /= 13, x /= 15, x /= 19]
-- [x*y| x <- [2,4,10],y <-[8,10,10,11], y/=10]
-- nouns = ["hobbo","frog","pope"]
-- adjectives = ["lazy","grouchy","scheming"]
-- [adjective ++ " " ++ noun | adjective <- adjectives, noun <-nouns]
length' xs = sum[1|_ <-xs] -- _ means nothing
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]-- Not that you're first
nestedComprehension xxs = [[x |x <-xs, even x]|xs <- xxs]
--Tuples
--[(1,20),(8,11,3),(4,5)]
-- This will throw an error as a list of tuples must be of the same type
-- fst ("wow",False)
-- snd ("wow",False)
-- These methods only work on 2-tuples not n-tuples
-- zip [1..5]["one","two","three","four","five"]
-- zip [1..]["one","two","three","four","five"] --Note that haskell is lazy and will end on the shorter lists
triangles = [(a,b,c)|c <- [1..10], b <- [1..10],a <- [1..10]]
rightTriangles = [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b],a^2 + b^2 == c^2, a+b+c == 24] -- Right angle triangles that has a perimeter of 24
