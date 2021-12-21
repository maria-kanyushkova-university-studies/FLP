einstein :-

    /* [Национальность, Животное, Тип сигарет, Напиток, Цвет дома] */

    Houses = [_,_,_,_,_],


    /* 01. Англичанин живёт в красном доме. */
    member([englishman,_,_,_,red], Houses),
    /* 02. Швед держит собак. */
    member([swede,dog,_,_,_], Houses),
    /* 03. Датчанин пьет чай. */
    member([dane,_,_,tea,_], Houses),
    /* 04. Зеленый дом слева от белого. */
    nextto([_,_,_,_,green], [_,_,_,_,white], Houses),
    /* 05. Хозяин зеленого дома любить пить кофе. */
    member([_,_,_,coffee,green], Houses),
    /* 06. Любитель Рall Мall содержит птиц. */
    member([_,bird,pallmall,_,_], Houses),
    /* 07. Хозяин желтого дома курит Dunhill. */
    member([_,_,dunhill,_,yellow], Houses),
    /* 08. В центральном доме предпочитают молоко. */
    nth1(3, Houses, [_,_,_,milk,_]),
    /* 09. Норвежец живет в первом доме. */
    nth1(1, Houses, [norwegian,_,_,_,_]),
    /* 10. Курящий Вlend живет по соседству с хозяином кошек. */
    neighbors([_,_,blend,_,_], [_,cat,_,_,_], Houses),
    /* 11. Хозяин лошадей живет рядом с тем, кто курит Dunhill. */
    neighbors([_,horse,_,_,_], [_,_,dunhill,_,_], Houses),
    /* 12. Любитель пива курит Вluemasters. */
    member([_,_,bluemasters,beer,_], Houses),
    /* 13. Немец курит Рrince. */
    member([german,_,prince,_,_], Houses),
    /* 14. Норвежец живет рядом с синим домом. */
    neighbors([norwegian,_,_,_,_], [_,_,_,_,blue], Houses),
    /* 15. Курящий Вlend живет по соседству с пьющим воду. */
    neighbors([_,_,blend,_,_], [_,_,_,water,_], Houses),


    /* Кто держит рыбок? */
    member([Owner,fish,_,_,_], Houses),

    print('Владелец рыбки: '), print(Owner), nl, nl,
    print('Полное решение: '), print(Houses), nl.

neighbors(X, Y, List) :- nextto(X, Y, List) ; nextto(Y, X, List) .