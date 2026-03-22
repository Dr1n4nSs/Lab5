:- encoding(utf8).

digit(0). digit(1). digit(2). digit(3). digit(4). 
digit(5). digit(6). digit(7). digit(8). digit(9).

not_member(_, []).
not_member(X, [H|T]) :- 
    X \= H, 
    not_member(X, T).

all_different([]).
all_different([H|T]) :- 
    not_member(H, T), 
    all_different(T).

print_all([]).
print_all([[S, D, E]|T]) :-
    write(S), write(D), write(E), write(" "),
    print_all(T).

main :-
    write("Список всех трехзначных чисел с разными цифрами:\n"), nl,
    findall([S, D, E], (
        digit(S), S \= 0,
        digit(D),
        digit(E),
        all_different([S, D, E])
    ), List),
    print_all(List),
    nl, write("\nПоиск завершен."), nl.

:- initialization(main).