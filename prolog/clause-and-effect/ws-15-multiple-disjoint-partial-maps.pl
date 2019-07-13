% Worksheet 15 - Multiple Disjoint Partial Maps 1

herd([], [], []).
% if the head is a sheep, append it to the first result (sheep) group.
herd([sheep|T], [sheep|S], G) :- herd(T, S, G).
% if the head is a goat, append it to the second result (sheep) group.
herd([goat|T], S, [goat|G]) :- herd(T, S, G).
% ignore non sheep and goats.
herd([_|T], S, G) :- herd(T, S, G).

% Queries
% 
% ?- herd([sheep, goat, goat, sheep, goat], X, Y).
% ?- herd([goat, sheep, stone, goat, tree], X, Y).
% ?- herd(X, [sheep, sheep], [goat, goat]).

% ----

herd2([], [], [], []).
herd2([sheep|T], [sheep|S], G, Z) :- herd2(T, S, G, Z).
herd2([goat|T], S, [goat|G], Z) :- herd2(T, S, G, Z).
herd2([X|T], S, G, [X|Z]) :- herd2(T, S, G, Z).

% Queries
% 
% ?- herd2([goat, sheep, stone, goat, tree], X, Y, Z).


% -----

% Uses the length of the list to determine odd/even.
alternate([], [], []).
alternate([X|T], [X|O], E) :- len(T, 0, L), odd(L), alternate(T, O, E).
alternate([X|T], O, [X|E]) :- len(T, 0, L), even(L), alternate(T, O, E).
odd(X) :- 1 is mod(X, 2).
even(X) :- 0 is mod(X, 2).
len([], Acc, Acc).
len([_|XT], Acc, Y) :- AccN is Acc + 1, len(XT, AccN, Y).

% Queries
% 
% ?- alternate([1, 2, 3, 4, 5, 6], X, Y).
% ?- alternate([a, b, c, d, e, f], X, Y).

% Uses an accumulator to fetermine odd/even.
alternate2([], _, [], []).
alternate2([X|T], Acc, [X|O], E) :- AccN is Acc + 1, odd(AccN), alternate2(T, AccN, O, E).
alternate2([X|T], Acc, O, [X|E]) :- AccN is Acc + 1, even(AccN), alternate2(T, AccN, O, E).

% Queries
% 
% ?- alternate2([1, 2, 3, 4, 5, 6], 0, X, Y).
% ?- alternate2([a, b, c, d, e, f], 0, X, Y).



