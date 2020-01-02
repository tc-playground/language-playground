% Worksheet 3 - Affordable Journies

% map of south-east england
border(sussex, kent).
border(sussex, surrey).
border(surrey, kent).
border(hampshire, sussex).
border(hampshire, surrey).
border(hampshire, berkshire).
border(berkshire, surrey).
border(wiltshire, hampshire).
border(wiltshire, berkshire).

% borders are symetric.
adjacent(X,Y) :- border(X,Y).
adjacent(X,Y) :- border(Y,X).

% an affordable journey is: a journey that spans
% no more than two counties:
affordable(X,Y) :- adjacent(X,Z), adjacent(Z,Y).


% Queries
% 
% ?- affordable(wiltshire, sussex).
% ?- affordable(wiltshire, kent).
% ?- affordable(hampshire, hampshire).
% ?- affordable(X, kent).
% ?- affordable(sussex, X).
% ?- affordable(X, V).