% Worksheet 14 - Partial Maps (reduce) with parameters

a(g, h).
a(g, d).
a(e, d).
a(h, f).
a(e, f).
a(a, e).
a(a, b).
a(b, f).
a(b, c).
a(f, c).

% path(X,X).
% path(X,Y) :- a(X, Z), path(Z, Y).

% define the partial map reduce, such that the goal reduce(L, X, M) 
% succeeds for input list L, term X, and output list M.
% 
% List M contains the elements of L, except for the first occurrence of X. Thus,
% X is a parameter of the partial map which controls which element will be
% left out.
% 
% The first clause checks whether the next element of the input unifies
% with the parameter. If so, the element is not included in the output list.
% 
% The second clause assumes that the unification test fails, so maps the
% input to the output.
% 
% This effectively removes X from the list if it is present. Or, fails.
% 
% NB: X is being passed as a parameter throughout the clauses.
% 
reduce([X|T], X, T).
reduce([H|T], X, [H|L]) :- reduce(T, X, L).

path(X, X, _).
path(X, Y, L) :- a(X, Z), reduce(L, Z, L1), path(Z, Y, L1).

% Queries
% 
% ?- path(a,b, [a,b,c,d,e,f,g,h]).
% ?- reduce([a,b,c,d,e], c, X).