module Shapes
( Point(..)
, Shape(..)
, surface
, nudge
, baseCircle
, baseRect
) where

-- Circle takes coords and radius; Rectangle takes the x1 y1 and x2 y2 coords
-- Can't show by default, we make this part of the Show typeClass
-- data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface:: Shape -> Float
-- surface (Circle _ _ r) = pi * r^2
-- surface (Rectangle x1 y1 x2 y2) = (abs $ x2 -x1) * (abs $ y2 -y1)
surface (Circle _ r) = pi * r^2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 -x1) * (abs $ y2 -y1)

-- Shaoe is the data and we pattern match to find the shape we want to use
-- surface $ Circle 10 20 10
-- surface $ Rectangle 0 0 100

-- map (Circle 10 20) [4,5,6,6]
-- [Circle 10.0 20.0 4.0,Circle 10.0 20.0 5.0,Circle 10.0 20.0 6.0,Circle 10.0 20.0 6.0]

-- With point
-- surface (Rectangle (Point 0 0) (Point 100 100))
-- surface (Circle (Point 0 0) 24)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle(Point x y)r) a b= Circle(Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

--Creates base shapes
baseCircle :: Float -> Shape
baseCircle = Circle (Point 0 0)

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)


-- Record Sytnax

-- he first field is the first name, the second is the last name, the third is the age and so on
-- data Person = Person String String Int Float String String deriving (Show)
--
-- let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
--
-- firstName :: Person -> String
-- firstName (Person firstname _ _ _ _ _) = firstname
--
-- lastName :: Person -> String
-- lastName (Person _ lastname _ _ _ _) = lastname
--
-- age :: Person -> Int
-- age (Person _ _ age _ _ _) = age
--
-- height :: Person -> Float
-- height (Person _ _ _ height _ _) = height
--
-- phoneNumber :: Person -> String
-- phoneNumber (Person _ _ _ _ number _) = number
--
-- flavor :: Person -> String
-- flavor (Person _ _ _ _ _ flavor) = flavor

-- firstName guy

-- Better way to represent Person
-- data Person = Person { firstName :: String
--                      , lastName :: String
--                      , age :: Int
--                      , height :: Float
--                      , phoneNumber :: String
--                      , flavor :: String
--                      } deriving (Show)

--Mindless let example
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
  let
    sideArea = 2*pi*r*h
    topArea = pi * r^2
    in sideArea + 2 * topArea


-- Type Paramters
-- data Maybe a = Noting| Just a
-- data Car = Car {
--   compnay:: Sting,
--   model :: String,
--   year ::Int
-- } deriving (Show)
-- Using type Paramters
data Car a b c = Car { company :: a
                     , model :: b
                     , year :: c
                     } deriving (Show)


data Person = Person {
  firstName::String,
  lastName::String,
  age:: Int
} deriving (Eq, Show, Read)

-- let mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}
-- "mikeD is: " ++ show mikeD
-- Read is the inverse of show
-- read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person
-- read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" == mikeD


--Enums
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- read "Saturday" :: Day
-- minBound :: Day
-- succ Monday
-- [Thursday .. Sunday]

phoneBook :: [(String,String)]
phoneBook =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

-- type PhoneBook = [(String,String)]

--  More expressive renmaing string to name and phoneNumber
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name,PhoneNumber)]


--Pick up from Recursive data strcutures
