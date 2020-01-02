% Worksheet 4 - Directed Acyclic Graph

% abstract directed acyclic grpah
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

% Succeeds if there is a path from X to Y:
path(X,X).
path(X,Y) :- a(X, Z), path(Z, Y).


% Queries
% 
% What happens for each of the following goals? 
% Does back-tracking provide multiple answers? If so, why?
% What determines the order in which the graph is searched?
% 
% ?- path(f, f).
% ?- path(a, c).
% ?- path(g, e).
% ?- path(g, X).
% ?- path(X, h).