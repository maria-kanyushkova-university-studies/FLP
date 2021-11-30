/**
a) Создать базу данных "Хобби".
Предикат likes определяет отношение человек - хобби.
*/
likes(ellen, reading).
likes(john, reading).
likes(john, computers).
likes(john, badminton).
likes(john, photo).
likes(leonardo, badminton).
likes(eric, reading).
likes(eric, swimming).
likes(eric, chess).
likes(paul, swimming).

/**
b) Составить вопрос и найти тех, кто имеет четыре хобби.
*/
four_hobbi(X) :- setof(Y, likes(X, Y), Result), length(Result, 4).

/**
c) Составить вопрос и найти тех, у кого одинаковые хобби.
*/
equal(X, Y) :- likes(X, Z), likes(Y, Z), different(X, Y).