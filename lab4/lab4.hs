

main :: IO()
main = do
    putStr "mySplitAt:"
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
