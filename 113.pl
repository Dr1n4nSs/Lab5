:- encoding(utf8).

element_of(X, [X|_]).
element_of(X, [_|T]) :- 
    element_of(X, T).

is_subset([], _).
is_subset([H|T], SecondSet) :-
    element_of(H, SecondSet),
    is_subset(T, SecondSet). 

main :-
    write("Введите первое множество: "), nl,
    read(Set1),
    write("Введите второе множество: "), nl,
    read(Set2),
    
    (is_subset(Set1, Set2) ->
        write("Первое множество является подмножеством второго."), nl
    ; is_subset(Set2, Set1) ->
        write("Второе множество является подмножеством первого."), nl
    ; 
        write("Ни одно из множеств не является подмножеством другого."), nl
    ),
    
    write("Работа завершена."), nl.

:- initialization(main).