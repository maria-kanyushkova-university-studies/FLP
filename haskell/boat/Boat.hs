import qualified Data.List as List
import Debug.Trace

data Action = Move { left :: [Bool], -- что находится на левом острове
                     right :: [Bool], -- что находится на правом острове
                     side :: Bool, -- сторона лодочника, фолс лево, тру право
                     index :: Int, -- номер итерации
                     prev :: Action, -- предыдущее состояние
                     comment :: (Int, Bool) -- остановка вывода -2 инит и конец
              } | 
              Stop deriving (Show) 


-- проверка двух состояний для исключения повторных состояний (когда с одной стороны все находятся) (чтобы было меньше перебора)
isEqual :: Action -> Action -> Bool
isEqual act1 act2 = and [ left act1 == left act2, right act1 == right act2, side act1 == side act2 ]

-- первый элемент состояния (кто находится где), и фильтруем хвост по isEqual и убираем повторения
filterList :: [Action] -> [Action]
filterList [] = []
filterList list = list !! 0 : filterList [ list !! i | i <- [1 .. length list-1], not (isEqual (list !! i) (list !! 0)) ]

-- убираем плохие сценарии
filterScenarios :: [Action] -> [[Bool]] -> [Action]
filterScenarios list badCases = [ act | act <- list, not(if side act then left act `elem` badCases else right act `elem` badCases) ]

-- переборный поиск в ширину, вдруг повезет, какой мув можно сделать сразу
getMoves :: Action -> [Action]
getMoves act = newActions ++ [noCarryAction]  --(side1, side2, not manSide, weight, last1, last2, manLast, lastWeight)
    where curSide = if (side act == False) then left act else right act
    
          swap :: [Bool] -> Int -> [Bool]
          swap xs index = [if i == index then not (xs!!i) else xs!!i | i <- [0..length xs-1]]
          
          newActions = [
              Move {
                  left = swap (left act) i, 
                  right = swap (right act) i, 
                  side = not (side act), 
                  index = (index act) + 1, 
                  prev = act,
                  comment = (i, not (side act))
              } | i <- [0..length curSide -1], curSide !! i /= False]

              -- когда не таскаем объект, просто меняем сторону лодочника
          noCarryAction = Move {
              left = left act, 
              right = right act, 
              side = not (side act), 
              index = (index act) + 1, 
              prev = act,
              comment = (-1, not (side act))
          }
          
--
recursiveSearch :: ([Action], Action, [[Bool]]) -> ([Action], Action, [[Bool]])
recursiveSearch (input, endCase, badCases)
    | isEnd = (endSougt, endCase, badCases)
    | otherwise = recursiveSearch (res, endCase, badCases)  --trace (show res ++ "\n") ()
    -- i - поэлементный инпут, concat - все варианты без сортировки
    where unclearedRes = List.concat [getMoves i | i <- input]
          -- фильтр
          res = filterScenarios (filterList (unclearedRes ++ input)) badCases
          -- бул переменная, если в списке найдено конечное состояние
          isEnd = any (\act -> isEqual act endCase) res
          -- записываем новый экшен и делаем ссылку на предыдущее состояние
          endSougt = if isEnd then [act | act <- res, isEqual act endCase] else []::[Action]

-- инициализация поисковой рекурсии
search :: Action -> Action -> [[Bool]] -> [Action]
search start end bad = res
    where (res, _, _) = recursiveSearch ([start], end, bad)

-- вывод единственного путя, развертка того действия
prettierPrint :: Action -> String
prettierPrint moves
    | index moves == 0 = show (lside) ++ " " ++ show (rside) ++ " " ++ show (manSide) ++ commentary ++ "\n"
    | otherwise = prettierPrint (prev moves) ++ show (lside) ++ " " ++ show (rside) ++ " " ++ show (manSide) ++ commentary ++ "\n"
    where lside = [if (left moves) !! i then ["Cabb", "Goat", "Wolf"] !! i else "----" | i <- [0 .. length (left moves)-1]]
          rside = [if (right moves) !! i then ["Cabb", "Goat", "Wolf"] !! i else "----" | i <- [0 .. length (right moves)-1]]
          manSide = if side moves then "RIGHT" else "LEFT "
          commentary = if fst(comment moves) == -2 
                       then "    Initial state"
                       else (if fst(comment moves) == -1 
                           then "    Moving to " ++ (if snd(comment moves) then "RIGHT " else "LEFT ") ++ "side EMPTY"
                           else "    Moving to " ++ (if snd(comment moves) then "RIGHT " else "LEFT ") ++ "side with " ++ ["Cabb", "Goat", "Wolf"] !! fst(comment moves) ++ " on board"
                           )
main :: IO()
main = do
    -- situation A
    let start = Move { left=[True, True, True], right=[False, False, False], side=False, index=0, prev=Stop, comment=(-2, False) } 
    let end = Move { left=[False, False, False], right=[True, True, True], side=True, index=0, prev=Stop, comment=(-2, False) }
    let badScenarios = [[True, True, False], [False, True, True]]
    --putStr(prettierPrint ((search start end badScenarios)!!0))
    
    -- situation B
    let start1 = Move { left=[True, True, True], right=[False, False, False], side=False, index=0, prev=Stop, comment=(-2, False) } 
    let end1 = Move { left=[False, False, False], right=[True, True, True], side=False, index=0, prev=Stop, comment=(-2, False) }
    --putStr(prettierPrint ((search start1 end1 badScenarios)!!0))
    
    -- situation C
    let start2 = Move { left=[False, True, True], right=[True, False, False], side=False, index=0, prev=Stop, comment=(-2, False) } 
    let end2 = Move { left=[False, False, False], right=[True, True, True], side=True, index=0, prev=Stop, comment=(-2, False) }
    --putStr(prettierPrint ((search start2 end2 badScenarios)!!0))
    
    -- situation D
    let start3 = Move { left=[True, True, True], right=[False, False, False], side=False, index=0, prev=Stop, comment=(-2, False) } 
    let end3 = Move { left=[True, False, False], right=[False, True, True], side=True, index=0, prev=Stop, comment=(-2, False) }
    --putStr(prettierPrint ((search start3 end3 badScenarios)!!0))
    
    -- situation E
    let start4 = Move { left=[True, False, True], right=[False, True, False], side=False, index=0, prev=Stop, comment=(-2, False) } 
    let end4 = Move { left=[False, False, False], right=[True, True, True], side=True, index=0, prev=Stop, comment=(-2, False) }
    putStr(prettierPrint ((search start4 end4 badScenarios)!!0))
    putStr("")
    