order :-

    Bench = [_,_,_],

% vitya, misha

    nextto([yura], [misha], Bench),
    nextto([vitya], [yura], Bench),

    print('Полное решение: '), print(Bench), nl.

neighbors(X, Y, List) :- nextto(X, Y, List) ; nextto(Y, X, List) .