-- 1. Вывести на экран сформированный список, данные для которого вводятся с клавиатуры: начальное значение, количество элементов, кратность.
-- Например- [14,21,28] 3 элемента списка, начинающиеся с 14, кратные 7. #2
list :: Int -> Int -> Int -> [Int]
list x y z = take y (filter (\v -> v `mod` z == 0) ([x..]))

main :: IO()
main = do
  putStrLn "Starting from:"
  x <- readLn
  putStrLn "taking:"
  y <- readLn
  putStrLn "divided by:"
  z <- readLn
  print (list (x :: Int) (y :: Int) (z :: Int))