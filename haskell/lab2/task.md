#LW2. Запустить режим отладки и выполнить задания:

Определите  функции. В качестве ответа скопируйте содержимое модуля в форум и прикрепите модуль в виде отдельного файла.

###0.do_my_list(N) #2

Параметром является число N. функция генерирует список из N элементов, начиная с указанного элемента N

```haskell
do_my_list :: Int-> [Int]
```
Например:
```haskell
do_my_list(5) -- вернет [5,6,7,8,9]
do_my_list(4) -- вернет [4,5,6,7]
```

###1. oddEven(L) #2
Функция перестановки местами соседних элементов списка L.

Например, список [2,5,7,9,1,8]  после преобразования будет иметь вид [5,2,9,7,8,1])   

###2. insert (L,A,n) #2
Функция включения в список L заданного атома А на определенную позицию n.  

###3. listSumm(L1,L2) #2
Функция сложения элементов двух списков. Возвращает список, составленный из сумм элементов списков - параметров L1, L2. Учесть, что переданные списки могут быть разной длины. 

###4. position (L,A) #2
Возвращает номер первого вхождения заданного атома  А в список L.  

###5. Найти сумму  F(n)=∑i=1ni   .#2
###6. Найти сумму F(n)=∑i=1nn−i  .#2

В качестве шаблона (lab2.hs) можно использовать:
```haskell
import System.IO
--здесь описание ваших функций
do_my_list :: Int-> [Int]
--параметром является число N. функция генерирует список из N элементов, начиная с указанного элемента N

main :: IO ()

main = do
    putStr "N1:"
    print (fst ((1, 'a'), "abc"))
    putStr "N2:"
    print (tail ['a', 'b', 'c'])

```
