/*
1. Укажите, красным или зеленым является отсечение в процедуре:
Если отсечение красное, приведите пример цели, которая дает разные решения при наличии отсечения в процедуре и его изъятии.
*/
member(X,[X|_]):-!.
member(X,[_|L]):-member(X,L).

/*
Красное отсечение. В данном случае оно не перебирает варианты

для
?-member(2,[2,3,4,5,7]).
true.

?-member(2,[2,3,4,2,2]).
true.

?-member(2,[0,3,4,1,3]).
false.

Если уберем отсечение от этих же примеров получим дургие результаты
?-member(2,[2,3,4,5,7]).
true ;
false.

?-member(2,[2,3,4,2,2]).
true ;
true ;
true ;
false.

?-member(2,[0,3,4,1,3]).
false.
*/

/*
2. Написать отношение fib(N,F), которое находит по аргументу N (номер числа в последовательности) число Фибоначчи F.
*/
fib(N, error):-N < 1, !.
fib(N, 1):-N < 3, !.
fib(N, F):-
    fib(N - 1, F1),
    fib(N - 2, F2),
    F is F1 + F2.

/*
3.1. Отсортируйте массив методом Шелла. Сортировка Шелла алгоритм сортировки, являющийся усовершенствованным вариантом
сортировки вставками. Идея метода Шелла состоит в сравнении элементов, стоящих не только рядом, но и на определённом
расстоянии друг от друга.
*/
d(1, Len, Res) :- Res is Len // 2 + Len mod 2, !.
d(I, Len, Res) :- DecrementedI is I - 1, d(DecrementedI, Len, Ans), Res is Ans // 2 + Ans mod 2, !.

take(N, _, Xs) :- N =< 0, !, N =:= 0, Xs = [].
take(_, [], []).
take(N, [X|Xs], [X|Ys]) :- M is N-1, take(M, Xs, Ys).

shell(List, Res) :- length(List, LengthOfList), shellGapIterator(List, LengthOfList, 1, Res).

shellGapIterator(List, LengthOfList, D, Res) :-
    d(D, LengthOfList, Gap),
    shellIterator(Gap, List, Res),
    Gap is 1, !.
shellGapIterator(List, LengthOfList, D, Res) :-
    d(D, LengthOfList, Gap),
    shellIterator(Gap, List, Ans),
    IncrementedD is D + 1,
    shellGapIterator(Ans, LengthOfList, IncrementedD, Res).

shellIterator(_, [], []) :- !.
shellIterator(Gap, List, List) :- length(List, ListLength), Gap > ListLength - 1, !.
shellIterator(Gap, List, [H|Res]) :- swapInGap(Gap, List, [H|Ans]), shellIterator(Gap, Ans, Res).

swapInGap(Gap, List, Res) :-
    take(Gap, List, [H1|Left]),
    append([H1|Left], [H2|Right], List),
    swapIfGreater(H1, H2, HRes1, HRes2),
    append([HRes1|Left], [HRes2|Right], Res).

swapIfGreater(X1, X2, X2, X1) :- X1 > X2, !.
swapIfGreater(X1, X2, X1, X2).

/*
3.2. Дополните программу предикатами ввода-вывода таким образом, чтобы мог быть реализован следующий диалог
*/
sort_3 :-
    write('list? '),
    read(InputList), nl,
    write('answer: '),
    shell(InputList, Res),
    write(Res).

/*
4. Для каждого из перечисленных методов сортировки выполните следующее:
Дополните программы сортировки предикатами ввода-вывода таким образом,
чтобы мог быть реализован диалог.
*/

/*
4.1. Метод наивной сортировки (назвать правило sort_4_1).
*/
sortn(L1, L2) :- permutation(L1, L2), sorted(L2),!.
permutation(L, [H|T]) :- append(V, [H|U], L), append(V, U, W), permutation(W, T).
permutation([], []).
sorted([_]).
sorted([X,Y|T]) :- order(X,Y), sorted([Y|T]).
order(X, Y) :- X =< Y.

sort_4_1 :-
    write('list? '),
    read(InputList), nl,
    write('answer: '),
    sortn(InputList, Res),
    write(Res).

/*
4.2. Метод пузырька (назвать правило sort_4_2).
*/
busort(L, S) :- swap(L, M), !, busort(M, S).
busort(L, L) :- !.
swap([X, Y|R], [Y, X|R]) :- order(Y, X).
swap([X|R], [X|R1]) :- swap(R, R1).

sort_4_2 :-
    write('list? '),
    read(InputList), nl,
    write('answer: '),
    busort(InputList, Res),
    write(Res).

/*
4.3. Метод вставки (назвать правило sort_4_3).
*/
insort([], []).
insort([X|L], M) :- insort(L, N), insortx(X, N, M).
insortx(X, [A|L], [A|M]) :- order(A, X), !, insortx(X, L, M).
insortx(X, L, [X|L]).

sort_4_3 :-
    write('list? '),
    read(InputList), nl,
    write('answer: '),
    insort(InputList, Res),
    write(Res).

/*
4.4. Быстрая сортировка quick (назвать правило sort_4_4).
*/
qsort([], []).
qsort([H|Tail], S) :- split(H, Tail, Small, Big), qsort(Small,Small1), qsort(Big, Big1), append(Small1, [H|Big1], S).
split(H, [A|Tail], [A|Small], Big) :- order(A, H), !, split(H, Tail, Small, Big).
split(H, [A|Tail], Small, [A|Big]) :- split(H, Tail, Small, Big).
split(_, [], [], []).

sort_4_4 :-
    write('list? '),
    read(InputList), nl,
    write('answer: '),
    qsort(InputList, Res),
    write(Res).

/*
5. Построить бесповторный упорядоченный список L3, состоящий из всех элементов,
содержащихся как в списке L1, так и в списке L2.
*/
common(L1, L2, Res) :- append(L1, L2, List), qsort(List, SortedList), makeUnique(SortedList, Res), !.

makeUnique([], []) :- !.
makeUnique([H,H|T], Res) :- makeUnique([H|T], Res), !.
makeUnique([H|T], [H|Res]) :- makeUnique(T, Res).

/*
6. Определить самый распространенный элемент X в списке L.
Если в списке несколько самых распространенных элементов, то ответ надо сделать в виде списка из самых распространенных элементов.
*/
countRepeated([Elem|Xs], Elem, Count, Ys) :-
    countRepeated(Xs, Elem, Count1, Ys), Count is Count1+1.
countRepeated([AnotherElem|Ys], Elem, 0, [AnotherElem|Ys]) :-
    Elem \= AnotherElem.
countRepeated([], _, 0, []).

rle([X|Xs], [[C,X]|Ys]) :-
    countRepeated([X|Xs], X, C, Zs),
    rle(Zs, Ys).
rle([], []).

isEqual(A, A).
isNotEqual(A,B):- A\=B.

unionRepeated([], _, []) :- !.

unionRepeated([[CountR, _]| T], Length, NewUnion) :-
    isNotEqual(CountR, Length),
    unionRepeated(T, Length, NewUnion), !.

unionRepeated([[Length, El]| T], Length, [El|NewUnion]) :-
    unionRepeated(T, Length, NewUnion).

most_oft(L, X):-
    msort(L, SList),
    rle(SList, RLE),
    sort(RLE, SRLE),
    reverse(SRLE, [[Length|_]|_]),
    unionRepeated(SRLE, Length, X), !.


