import MyModule

main :: IO()
main = do
    putStr "mySplitAt:\n"
    print (mySplitAt 3 "heyman")
    -- => ("hey", "man")

    print (mySplitAt 100 "heyman")
    -- => ("heyman", "")

    print (mySplitAt (-3) "heyman")
    -- => ("", "heyman")

    print (mySplitAt 0 "heyman")
    -- => ("", "heyman")

    print (mySplitAt 3 [1, 2, 3, 4, 5, 6])
    -- => ([1, 2, 3], [4, 5, 6])

    print (mySplitAt 100 [1, 2, 3, 4, 5, 6])
    -- => ([1, 2, 3, 4, 5, 6], [])

    print (mySplitAt (-3) [1, 2, 3, 4, 5, 6])
    -- => ([], [1, 2, 3, 4, 5, 6])

    print (mySplitAt 0 [1, 2, 3, 4, 5, 6])
    -- => ([], [1, 2, 3, 4, 5, 6])


    putStr "myIsHexDigit:\n"
    print (myIsAscii '0')
    -- => ("True")

    print (myIsAscii 'A')
    -- => ("True")

    print (myIsAscii '~')
    -- => ("True")

    print (myIsAscii 'Ё')
    -- => ("True")

    print (myIsAscii 'ї')
    -- => ("True")

    print (myIsAscii '█')
    -- => ("True")


    putStr "myIsHexDigit:\n"
    print (myIsHexDigit '0')
    -- => ("True")

    print (myIsHexDigit '1')
    -- => ("True")

    print (myIsHexDigit 'A')
    -- => ("True")

    print (myIsHexDigit 'G')
    -- => ("False")

    print (myIsHexDigit 'a')
    -- => ("True")

    print (myIsHexDigit 'g')
    -- => ("False")

    print (myIsHexDigit '*')
    -- => ("False")


    putStr "myMapSize:\n"
    print (myMapSize Map.empty)
    -- => ("0")

    print (myMapSize Map.null)
    -- => ("0")

    print (myMapSize Map.singleton 1 'a')
    -- => ("1")

    print (myMapSize Map.fromList[(1,'a'), (2,'c'), (3,'b')])
    -- => ("3")

    print (myMapSize Map.fromList[(2,4),(3,3),(4,2),(5,4),(6,4)])
    -- => ("5")


    putStr "mySetSize:\n"
    print (mySetSize Set.empty)
    -- => ("0")

    print (mySetSize Set.null)
    -- => ("0")

    print (mySetSize Set.singleton('a'))
    -- => ("1")

    print (mySetSize Set.fromList(['a','c','b']))
    -- => ("3")

    print (mySetSize Set.fromList([4,3,2,5,6,4]))
    -- => ("6")


