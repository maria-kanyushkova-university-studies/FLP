/*
Решение на прологе ничем не отличается от решения на хаскеле, у них можно
сказать одинаковое решение, только на прологе оно будет лаконичным.
В обоих случаях это перебор до хорошей комбинации, которую в хаскеле ищем мы,
а в прологе ищет сам пролог по заданным правилам.
Если судить по ответу, который получается, во всех задачах он одинаковый,
а если конкретнее:

а) фермер перевозит волка, козла и капусту на другой берег.
Начальное состояние:
    Левый берег: ["Cabb","Goat","Wolf"]
    Правый берег: ["----","----","----"]
    Фермер: Слева
Конечное состояние:
    Левый берег: ["----","----","----"]
    Правый берег: ["Cabb","Goat","Wolf"]
    Фермер: Справа

Решение:
    Haskel                                      Prolog

    Moving to RIGHT side with Goat on board     The farmer takes the Goat fromwest of the river to east
    Moving to LEFT side EMPTY                   The farmer crosses the river from east to west
    Moving to RIGHT side with Cabb on board     The farmer takes the cabbage from west of the river to east
    Moving to LEFT side with Goat on board      The farmer takes the Goat fromeast of the river to west
    Moving to RIGHT side with Wolf on board     The farmer takes the Wolf from west of the river to east
    Moving to LEFT side EMPTY                   The farmer crosses the river from east to west
    Moving to RIGHT side with Goat on board     The farmer takes the Goat fromwest of the river to east



b) фермер перевозит волка, козла и капусту на другой берег, а сам возвращается.
Начальное состояние:
    Левый берег: ["Cabb","Goat","Wolf"]
    Правый берег: ["----","----","----"]
    Фермер: Слева
Конечное состояние:
    Левый берег: ["----","----","----"]
    Правый берег: ["Cabb","Goat","Wolf"]
    Фермер: Слева

Решение:
    Haskel                                      Prolog

    Moving to RIGHT side with Goat on board     The farmer takes the Goat fromwest of the river to east
    Moving to LEFT side EMPTY                   The farmer crosses the river from east to west
    Moving to RIGHT side with Cabb on board     The farmer takes the cabbage from west of the river to east
    Moving to LEFT side with Goat on board      The farmer takes the Goat fromeast of the river to west
    Moving to RIGHT side with Wolf on board     The farmer takes the Wolf from west of the river to east
    Moving to LEFT side EMPTY                   The farmer crosses the river from east to west
    Moving to RIGHT side with Goat on board     The farmer takes the Goat fromwest of the river to east
    Moving to LEFT side EMPTY                   The farmer crosses the river from east to west



c) фермер перевозит на другой берег волка и козла, а капуста уже находится на том берегу.
Начальное состояние:
    Левый берег: ["----","Goat","Wolf"]
    Правый берег: ["Cabb","----","----"]
    Фермер: Слева
Конечное состояние:
    Левый берег: ["----","----","----"]
    Правый берег: ["Cabb","Goat","Wolf"]
    Фермер: Справа

Решение:
    Haskel                                      Prolog

    Moving to RIGHT side with Wolf on board     The farmer takes the Wolf from west of the river to east
    Moving to LEFT side EMPTY                   The farmer crosses the river from east to west
    Moving to RIGHT side with Goat on board     The farmer takes the Goat fromwest of the river to east



d) фермер перевозит на другой берег волка и козла, а капусту оставляет.
Начальное состояние:
    Левый берег: ["Cabb","Goat","Wolf"]
    Правый берег: ["----","----","----"]
    Фермер: Слева
Конечное состояние:
    Левый берег: ["Cabb","----","----"]
    Правый берег: ["----","Goat","Wolf"]
    Фермер: Справа

Решение:
    Haskel                                      Prolog

    Moving to RIGHT side with Goat on board     The farmer takes the Goat fromwest of the river to east
    Moving to LEFT side EMPTY                   The farmer crosses the river from east to west
    Moving to RIGHT side with Wolf on board     The farmer takes the Wolf from west of the river to east



e) фермер перевозит на другой берег волка и капусту, а козёл  уже ждет на том берегу.
Начальное состояние:
    Левый берег: ["Cabb","----","Wolf"]
    Правый берег: ["----","Goat","----"]
    Фермер: Слева
Конечное состояние:
    Левый берег: ["----","----","----"]
    Правый берег: ["Cabb","Goat","Wolf"]
    Фермер: Справа

Решение:
    Haskel                                      Prolog

    Moving to RIGHT side with Cabb on board     The farmer takes the cabbage from west of the river to east
    Moving to LEFT side with Goat on board      The farmer takes the Goat fromeast of the river to west
    Moving to RIGHT side with Wolf on board     The farmer takes the Wolf from west of the river to east
    Moving to LEFT side EMPTY                   The farmer crosses the river from east to west
    Moving to RIGHT side with Goat on board     The farmer takes the Goat fromwest of the river to east

Как видно, решения одинаковые во всех случаях
*/

room(a).
room(b).
room(c).
room(d).
room(e).
room(f).
room(g).
room(h).
room(j).
room(k).
room(l).

door(a, b).
door(b, c).
door(b, e).
door(c, d).
door(d, e).
door(d, h).
door(e, f).
door(e, j).
door(h, f).
door(f, i).
door(i, k).
door(i, j).
door(j, l).
door(j, g).
door(k, l).

isDoor(X, Y) :- door(X, Y); door(Y, X).

window(a, 0).
window(b, 1).
window(c, 1).
window(d, 0).
window(e, 0).
window(f, 1).
window(g, 0).
window(h, 3).
window(i, 1).
window(j, 1).
window(k, 2).
window(l, 1).

% первый параметр это проложить путь из какой комнаты, второй параметр это целевая комната,
% третий параметр специальный список для проверки и аккуратного сбора результата,
% так как начинаем с пустого массива, и сразу задается тип данных, а не указатель на какой-то элемент как было в 12ой лабе
% четвертый параметр это искомый путь
path(Goal, Goal, Ans, Ans).
path(Start, Goal, List, Res) :-
    isDoor(Start, Next),
    \+ member(Next, List),  % проверка на то что в этой комнате мы не были
    append(List, [Next], NewList),
    path(Next, Goal, NewList, Res).


% первый параметр это проложить путь из какой комнаты, второй параметр это целевая комната,
% третий параметр специальный список для проверки и аккуратного сбора результата,
% так как начинаем с пустого массива, и сразу задается тип данных, а не указатель на какой-то элемент как было в 12ой лабе
% четвертый параметр это искомый путь
% пятый параметр это тоже начальное состояние по счетчику окон и сборка количества окон по путю
% шестой парметр это результат количество окон встреченных на пути
windowPath(Goal, Goal, Ans, Ans, Windows, WindowsRes) :-
window(Goal , WindowsInThisRoom), WindowsRes is Windows + WindowsInThisRoom.
windowPath(Start, Goal, List, Res, Windows, WindowsRes) :-
    isDoor(Start, Next),
    \+ member(Next, List),  % проверка на то что в этой комнате мы не были
    append(List, [Next], NewList),
    window(Start , WindowsInThisRoom),
    NewWindows is Windows + WindowsInThisRoom,
    windowPath(Next, Goal, NewList, Res, NewWindows, WindowsRes).

/*5.2 #1
Напечатать список комнат, через которые лежит путь к комнате G, выбранный Прологом.
*/
path2 :- path(a, g, [], Res), write(Res), nl, !.


/*5.3 #1
При входе в комнату X печатать "entering room X".
*/
path3 :- path(a, g, [], Res), path3Writing(Res), nl, !.

path3Writing([]).
path3Writing([H|List]) :- write("entering room "), write(H), nl, path3Writing(List).

/*5.4 #1
Посчитать и напечатать количество комнат, через которые надо пройти к G
*/
path4 :- path(a, g, [], Res), write(Res), length(Res, ResLength), write(" "), write(ResLength), nl, !.

/*5.5 #1
Пройти к комнате L ,не входя в комнату E.
*/
path5 :- path(a, g, [], Res), \+ member(e, Res), write(Res), nl, !.

/*5.6 #1
Найти и напечатать все возможные пути из комнаты А  в комнату L.
*/
path6 :- findall(Res, path(a, l, [], Res), Bag), write(Bag), nl.

/*5.7 #2
В некоторых комнатах есть окна. Например, в комнате H их целых три.  Надо посчитать количество окон в комнатах, через
которые лежит путь  к комнате L.
*/
path7 :- windowPath(a, l, [], Res, 0, Windows), write(Res), write(" "), write(Windows), nl, !.

/*5.8 #2
Найти самый короткий путь к комнате L, используя assert и retract. Идея состоит в следующем: надо задать заведомо
самый длинный путь way(М), а затем, перебирая все возможные пути к L, заменять way(M) на более короткий,используя
при этом assert и retract.
*/
% assert добавить факт
% retract убрать факт

% по всем существующим путям делаем сортировку, если меньше чем предыдущий
% результат, но предыдущий стираем и новый записываем, в конце остается 1 путь
path8 :-
    assert(way([], 9999)),
    findall(
        Res,
        (
            path(a, l, [], Res),

            way(_, BestLen),
            length(Res, NewLen),
            NewLen < BestLen,
            retractall(way(_, _)),
            assert(way(Res, NewLen))
        ),
        _),
    way(Best, _),
    write(Best), nl.


/*5.9 #2
Сделать то же, что в пункте 5.8, но без assert и retract.
*/
% по всем существующим путям делаем сортировку,
% если лучшая длина меньше новой, то оставляем лучшую
% если лучшая длина не лучшая, то записываем новую лучшую длину
path9 :-
    findall(Res, path(a, l, [], Res), List),
    path9Iterate(List, [], 9999, Best, _),
    write(Best), nl.

path9Iterate([], Res, Len, Res, Len).
path9Iterate([H|Tail], BestRes, BestLen, Res, Len) :-
    length(H, NewLength),
    (
        BestLen =< NewLength,
        append([], BestRes, NewBestRes),
        NewBestLen is BestLen;
        BestLen > NewLength,
        append([], H, NewBestRes),
        NewBestLen is NewLength
    ),
    path9Iterate(Tail, NewBestRes, NewBestLen, Res, Len).

/*5.10 #4
Найти кратчайший путь, проходящий через все комнаты с кладом (клад в комнате обозначается знаком $)
*/

% сделали 2 новых факта с нахождением сокровищ
%


%
treasure(g).
treasure(l).

subset(_, []).
subset(List, [H|Tail]) :-
    member(H, List),
    subset(List, Tail).

pathBacktrack(Goal, Goal, Ans, Ans).  % можно вернутся если надо
pathBacktrack(Start, Goal, List, Res) :-
    isDoor(Start, Next),
    append(List, [Next], NewList),
    length(NewList, NewListLength),

    findall(X, room(X), AllRooms),
    length(AllRooms, RoomsCount),

    RoomsCount >= NewListLength,

    pathBacktrack(Next, Goal, NewList, Res).

path10 :-
    findall(Treasure, treasure(Treasure), TreasureList),
    write(TreasureList),nl,
    findall(Res, (pathBacktrack(a, _, [], Res), subset(Res, TreasureList)), List),
    path9Iterate(List, [], 9999, Best, _),
    write(Best), nl.