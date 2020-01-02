% Worksheet 9 - Searching a Cyclic Graph

a(g, h).
a(d, a).
a(g, d).
a(e, d).
a(h, f).
a(e, f).
a(a, e).
a(a, b).
a(b, f).
a(b, c).
a(f, c).

% Recursively find a path whilst check we have not already visited the node.
path(X, X, [_|_]).
path(X, Y, AlreadyVisted) :- a(X, Z), legal(Z, AlreadyVisted), path(Z, Y, [Z|AlreadyVisted]).

% Check if the node is 'legal' (not yet visited)/
legal(_, []).
legal(Z, [H|T]) :- Z \== H, legal(Z, T).

% Find if we can reach the destination from the origin (using an empty list to track the visited nodes.)
can_reach(X, Y) :- path(X, Y, []), !.

% Queries
% 
% ?- can_reach(a, b).
% 
% ?- path(g, c, [J).
% ?- path(g, c, [f]).
% ?- path(a, X, [f,d]).