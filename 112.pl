:- encoding(utf8).

find_max([H], H). 
find_max([H|T], Max) :-
    find_max(T, MaxTail),
    (H > MaxTail -> Max = H ; Max = MaxTail).

find_min([H], H). 
find_min([H|T], Min) :-
    find_min(T, MinTail),
    (H < MinTail -> Min = H ; Min = MinTail).

main :-
    write("Введите список чисел: "), nl,
    read(List),
    
    (is_list(List), List \= [] ->
        find_max(List, MaxVal),
        find_min(List, MinVal),
        Diff is MaxVal - MinVal,
        
        write("Максимальный элемент: "), write(MaxVal), nl,
        write("Минимальный элемент: "), write(MinVal), nl,
        write("Разность : "), write(Diff), nl
    ;   
        write("Введён пустой список."), nl
    ),
    
    write("Работа завершена."), nl.

:- initialization(main).
