main :: IO()

t_Fermat 1 = 1
t_Fermat n = n + t_Fermat (n - 1)

p_Fermat 1 = 1
p_Fermat n = t_Fermat n + p_Fermat (n - 1)

main = do
    putStr "N1:"
    print (snd(fst((1, 'a'), "abc")))
    putStr "N2:"
    print (head(tail ['a', 'b', 'c']))
    putStr "N2:"
    print (tail(head [['a', 'b'], ['c','d']]) !! 0)
    putStr "N2:"
    print (tail(head(tail([['a', 'c', 'd'], ['a','b']]))) !! 0)
    putStr "N2:"
    print (head(head(tail([['a','d'], ['b', 'c']]))))
    putStr "N3:"
    print ([1, 3 .. 20])
    putStr "N3:"
    print ([ x * 2 + 1 | x <- [0 .. 9]])
    putStr "N3:"
    print ([ x | x <- [1 .. 20], odd x])
    putStr "N4:"
    print (map t_Fermat [1 .. 50])
    putStr "N5:"
    print (map p_Fermat [1 .. 50])