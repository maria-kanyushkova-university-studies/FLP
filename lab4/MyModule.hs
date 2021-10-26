import Data.List

module MyModule (
   showEven,
   showBoolean
) where

-- 1. Data.List - splitAt
mySplitAt :: (Eq a) => Int -> [a] -> ([a], [a])
mySplitAt n a
	| a == [] = ([], [])
	| length a == 0 = (take 0 a, take 0 a)
	| n <= 0 = (take 0 a, a)
	| n >= length a = (a, take 0 a)
    | otherwise = (take n a, drop n a)