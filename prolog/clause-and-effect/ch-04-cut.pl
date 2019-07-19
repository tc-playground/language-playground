% Chapter 04 - Cut !

% membercheck ---

membercheck(X, [X|_]) :- !.
membercheck(X, [_|L]) :- membercheck(X, L).

membercheck2(X, [X|_]).
membercheck2(X, [_|L]) :- membercheck2(X, L).

% Queries
% 
% ?- membercheck(b, [a, b, c]).
% 
% However this will now only return a single result!
% 
% ?- membercheck(X, [a, b, c]).


% max ---

% The disadvantage is that each rule does not now stand on its own as 
% a logically correct statement about the predicate, unless, an additional 
% guard is added.
max(X, Y, X) :- X >= Y, !.
max(X, Y, Y) :- X < Y.

% max with deterministic predicates.
max2(X, V, Z) :- X >= V -> Z = X ; Z = V.


% drink ---

drink(milk).
drink(beer) :- !.
drink(gin).

% Queries
% 
% We wont drink Gin!
% 
% ?- drink(X).
% ?- drink(X), drink(Y).
% ?- drink(X), !, drink(Y).


% Disjoint Partial Map with Cut

% The goal split(L, P, N) succeeds for list of numbers L, where P
% is the list of the non-negative numbers in L, and N is the list of the
% negative numbers in L.

% Without cut.
split([], [], []).
split([H|T], [H|P], N) :- H >= 0, split(T, P, N).
split([H|T], P, [H|N]) :- H < 0, split(T, P, N).

bad_cut_split([], [], []).
bad_cut_split([H|T], [H|P], N) :- H >= 0, !, bad_cut_split(T, P, N).
bad_cut_split([H|T], P, [H|N]) :- bad_cut_split(T, P, N).

% Good use of cut has guards in all predicates to maintain logical independance.

good_cut_split([], [], []).
good_cut_split([H|T], [H|P], N) :- H >= 0, !, good_cut_split(T, P, N).
good_cut_split([H|T], P, [H|N]) :- H < 0, good_cut_split(T, P, N).

% Queries 
% 
% ?- split([0,-1,1,-2,2,-3,3], P, N).