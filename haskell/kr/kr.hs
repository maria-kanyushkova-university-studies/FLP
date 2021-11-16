import Data.Char
import Data.List

-- 1. Напишите функцию elemIndices :: Eq a => a -> [a] -> [Int], которая находит, под какими индексами в списке встречается заданный элемент #5
elemIndices :: (Eq a) => a -> [a] -> [Int]
elemIndices a [] = []
elemIndices a (x:xs)
    | a == x = length xs : elemIndices a xs
    | otherwise = elemIndices a xs

-- 2.Напишите функцию unevenHandWritingMy :: String-> String, которая берет строку и возвращает ее же, но каждая третья буква  должна стать прописной, если была строчной и наоборот. #5
unevenHandWritingMy :: String -> String
unevenHandWritingMy "" = ""
unevenHandWritingMy a = zipWith (\ c n -> 
  if (n==0) then 
    if (isLower c) then 
    	toUpper c 
      else 
      	toLower c
  else c) a $ map (\ x -> x `mod` 3) [1..]

-- 3.Напишите функцию, строящую список подсписков чисел: в первом подсписке будут степени единицы, во втором степени двойки, в третьем - тройки и так далее: [[1,1,1,...],[2,4,8,...],[3,9,27 ,...],...]. Количество элементов в подсписках, а также максимальное число, участвующее в образовании подсписков степеней числа, являются параметрами функции. Для предложенного примера [[1,1],[2,4],[3,9 ],[4,16]] количество элементов в подсписках= 2, мак число=4. #5
listOfDegreesLists :: Int -> Int -> [[Int]]
listOfDegreesLists i n = map (\ x -> take i (iterate(*x) x) ) [1, 2..n]

-- 4. Напишите функцию transpose :: [[a]]-> [[a]], которая берет список списков и транспонирует столбцы и строки. Например, transpose [[1,2,3],[4,5,6]] ==[[1,4],[2,5],[3,6]]. #5
transpose :: [[a]]->[[a]]
transpose ([]:_) = []
transpose x = (map head x) : transpose (map tail x)

-- 5. Напишите функцию, которая читает входной текстовый файл и выводит в выходной файл пары (слово:число), где слово - есть каждое уникальное слово файла, а число - количество вхождений этого слова. Пары должны быть отсортированы по убыванию чисел
uniqWordsStats :: String -> String -> IO ()
uniqWordsStats inFileName outFileName = do
    contents <- readFile inFileName
    let contentWords = words contents
    let uniqContentWords = nub contentWords
    let wordsStats = map (\ word -> (length (filter (word==) contentWords), word) ) uniqContentWords
    writeFile outFileName (intercalate "\n" (map (\ stat -> (show (fst stat)) ++ " " ++ (snd stat)) wordsStats))

    
main :: IO()
main = do
    putStr "N1-1:"
    print (elemIndices '1' "000")
    -- => []

    -- если не добавить reverse то индексы будут да, находится верно, но не в порядке возрастания
    putStr "N1-2:"
    print (reverse (elemIndices '1' "1231231"))
    -- => [0, 3, 6]

    putStr "N2-1:"
    print (unevenHandWritingMy "")
    -- => ""

    putStr "N2-2:"
    print (unevenHandWritingMy "abcdef")
    -- => "abCdeF"

    putStr "N21-3:"
    print (unevenHandWritingMy "1231231")
    -- => "1231231"

    putStr "N3-1:"
    print (listOfDegreesLists 0 0)
    -- => []

    putStr "N3-2:"
    print (listOfDegreesLists 1 1)
    -- => [[1]]

    putStr "N3-3:"
    print (listOfDegreesLists 2 4)
    -- => [[1,1],[2,4],[3,9 ],[4,16]]

    putStr "N3-4:"
    print (listOfDegreesLists 4 2)
    -- => [[1,1,1,1],[2,4,8,16]]

    putStr "N4-1:"
    print (transpose [[1,2,3],[4,5,6]])
    -- => [[1,4],[2,5],[3,6]]