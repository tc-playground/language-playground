% Towers of Hano3i

% Usage: hanoi where N is the number of discs. The game is configured with 3 poles.
hanoi(N) :- move(N, left, centre, right).

move(0, _, _, _) :- !.
move(N, A, B, C) :-
    M is N-1,
    move(M, A, C, B), inform(A, B), move(M, C, B, A).

inform(X, Y) :-
    write([move,a,disc,from, the,X,pole,to,the,Y,pole]),
    nl.
