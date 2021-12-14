import Data.List
import Data.Char
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Set (Set)
import qualified Data.Set as Set

module MyModule (
   mySplitAt,
   myIsAscii,
   myIsHexDigit,
   myMapSize,
   mySetSize,
) where

-- 1. Data.List - splitAt
mySplitAt :: (Eq a) => Int -> [a] -> ([a], [a])
mySplitAt n a
	| a == [] = ([], [])
	| length a == 0 = (take 0 a, take 0 a)
	| n <= 0 = (take 0 a, a)
	| n >= length a = (a, take 0 a)
  | otherwise = (take n a, drop n a)

-- 2. Data.Char - isAscii
myIsAscii :: Char -> Bool
myIsAscii c = ord c < 128

-- 3. Data.Char - isHexDigit
myIsHexDigit :: Char -> Bool
myIsHexDigit c = isDigit c ||
                 isCorrectLetter c

isCorrectHexLetter :: Char -> Bool
isCorrectHexLetter c
        | isUpper c = (ord c - ord 'A') <= 5
        | isLower c = (ord c - ord 'a') <= 5

-- 4. Data.Map - size
myMapSize :: Map k v -> Int
myMapSize x = length(x)

-- 5. Data.Set - size
mySetSize :: Set x -> Int
mySetSize x = length(x)


