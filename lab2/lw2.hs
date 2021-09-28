import Data.List hiding (insert)
import Data.Maybe

-- 0. do_my_list(N)
do_my_list :: Int-> [Int]
do_my_list x = take x([x..])

-- 1. oddEven(L)
oddEven :: [a] -> [a]  
oddEven [] = []  
oddEven [x] = [x]  
oddEven (h1:(h2:xs)) =h2:(h1 : (oddEven xs))

-- 2. insert (L,A,n)
insert :: [a] -> a -> Int -> [a]
insert a b pos = take pos a ++ [b] ++ drop pos a

-- 3. listSumm(L1,L2)
listSum :: Num a => [a] -> [a] -> [a]
listSum a b = zipWith (+) a b

-- 4. position (L,A)
position :: Eq a => a -> [a] -> Int
position x xs = fromMaybe (-1) (findIndex (==x) xs)

-- 5. Найти сумму  F(n)=∑i=1ni
summFn :: Int -> Int
summFn a = sum([1..a])

-- 6. Найти  сумму F(n)=∑i=1nn−i 
summFn1 :: Int -> Int
summFn1 a = sum([1..a-1])

main = do
        putStr "N0:"
        print (do_my_list 5)
        putStr "N1:"
        print (oddEven(do_my_list 6))
        putStr "N2:"
        print (insert (do_my_list 4) 100 1)
        putStr "N3:"
        print (listSum [1,2,3,44,55] [1,2,3])
        putStr "N4:"
        print (position 8 (do_my_list 6))
        putStr "N5:"
        print (sum [1..10-1])
        putStr "N6:"
        print (sum [1..10])
