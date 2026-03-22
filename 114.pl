:- encoding(utf8).

not_member(_, []).
not_member(X, [H|T]) :- 
    X \= H, 
    not_member(X, T).

all_different([]).
all_different([H|T]) :- 
    not_member(H, T), 
    all_different(T).

solve(Alik, Borya, Vitya, Lena, Dasha) :-

    City = [kharkiv, uman, poltava, slavyansk, kramatorsk],
    
    member(Alik, City),
    member(Borya, City),
    member(Vitya, City),
    member(Lena, City),
    member(Dasha, City),
    
    all_different([Alik, Borya, Vitya, Lena, Dasha]),

    (Alik = uman ; Borya = kramatorsk),

    ( (Borya = kharkiv, Vitya \= kharkiv) ; (Vitya = kharkiv, Borya \= kharkiv) ),

    (Vitya = slavyansk ; Lena = kharkiv),

    ( (Dasha = uman, Lena \= kramatorsk) ; (Lena = kramatorsk, Dasha \= uman) ).

main :-
    solve(Alik, Borya, Vitya, Lena, Dasha),
    write("Результаты распределения:"), nl,
    write("Алик: "), write(Alik), nl,
    write("Боря: "), write(Borya), nl,
    write("Витя: "), write(Vitya), nl,
    write("Лена: "), write(Lena), nl,
    write("Даша: "), write(Dasha), nl.

:- initialization(main).