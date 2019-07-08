% Worksheet 9 - Full Maps

% Full Maps  
% -----

sqlist([], []).
sqlist([X|T], [Y|L]) :-
    Y is X*X,
    sqlist(T, L).

% Queries
% 
% ?- sqlist([1,2,3,4,5], X).

% -----

% Square numbers and return pairs in a term sturcture.
sqterm([], []).
sqterm([X|T], [s(X, Y)|L]) :-
    Y is X*X,
    sqterm(T, L).

% Queries 
% 
% ?- sqterm([1,2,3,4,5], X).

% -----

% Generic fullmap. Higher-order versions can pass in the transform predicate.
fullmap([], []).
fullmap([X|T], [Y|L]) :-
    transform(X, Y),
    fullmap(T, L).

transform(X, Y) :-
    Y is X*X*X. % cube

% Queries 
% 
% ?- fullmap([1,2,3,4,5], X).

% -----

% Structure transformation put everything in a container.
envelope([], []).
envelope([X|T], [container(X)|L]) :-
    envelope(T, L).

% Queries 
% 
% ?- envelope([apple, peach, cat, 37, john], X)

% -----

% Translate atoms to a number scheme.
translate([], []).
translate([X|T], [Y|L]) :- encode(X, Y), translate(T, L).

encode(X, Y) :-
    atom_string(X, Z),
    string_codes(Z, Z1),
    sum(Z1, Y).

sum(X, Y) :- do_sum(X, 0, Y).
do_sum([], Acc, Acc).
do_sum([X|XT], Acc, Y) :-
    Res is Acc+X,
    do_sum(XT, Res, Y).

