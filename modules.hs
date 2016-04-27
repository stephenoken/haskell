import Data.List

import Data.Map

-- Import a selected group of modules
-- import Data.List (nub, sort)

-- You can also choose to import all of the functions of a module except a few select ones.
-- import Data.List hiding (nub)

-- Another way of dealing with name clashes is to do qualified imports.
-- import qualified Data.Map

-- That's why we can rename the qualified import to something shorter:
-- import qualified Data.Map as M
-- Custom Import
import Geometry


numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- Data.List
-- intersperse ',' "Monkey"

-- and $ map (>4) [5,6,7,8]
-- or
-- and ( map (>4) [5,6,7,8])

-- Data.Map
phoneBook =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

findKey :: (Eq k) => k -> [(k,v)] -> v
findKey key xs = snd . head . Data.List.filter (\(k,v) -> key == k) $ xs

sphere = Geometry.sphereVolume
