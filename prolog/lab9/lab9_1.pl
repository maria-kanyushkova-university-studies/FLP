/**
a) Создать базу данных для отношений parent,male,female.
*/
parent(bill, joe).
parent(bill, ann).
parent(sue, joe).
parent(sue, ann).
parent(joe, tammy).
parent(paul, jim).
parent(mary, jim).
parent(jim, bob).
parent(ann, bob).

male(bill).
male(paul).
male(joe).
male(jim).
male(bob).

female(sue).
female(mary).
female(ann).
female(tammy).

different(X, Y) :- X\=Y.
child(X, Y) :- parent(Y, X).
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), different(X, Y).
uncle(X, Y) :- parent(X, Z), brother(Z, Y).
brother_or_sister(X, Y) :- parent(Z, X), parent(Z, Y), different(X, Y).

/**
b) Составить вопрос и найти в базе данных бабушку для bob.
*/
grandma(X, Y) :- parent(E, X), parent(Y, E), female(Y).

/**
с) Составить вопрос и найти в базе данных внука.
*/
grandson(X, Y) :- male(Y), child(Z, Y), child(X, Z).

/**
d) Составить вопрос и найти в базе данных сестру для jim, включив в базу дaнных  правило сестра (sister (X,Y)).
*/
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), different(X, Y).

/**
e) Определите отношение "тётя" (aunt (X,Y)), используя правило для sister (X,Y).
*/
aunt(X, Y) :- parent(Z, Y), sister(X, Z).

/**
f) Определите отношение "кузин"- cousin(X,Y).
*/
cousin(X, Y) :- parent(Z, X), parent(A, Y), brother_or_sister(A, Z).
