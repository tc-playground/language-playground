% Worksheet 12 - Partial Maps

% The pattern is always the same. 
% A base case is needed to map the null list to the null list. 
% A first recursive case is needed to transform the input head to the output head provided it meets the conditions. 
% A second recursive case is needed if the first case fails.

evens([], []).
evens([X|T], [X|L]) :- 0 is X mod 2, evens(T, L).
evens([X|T], L) :- 1 is X mod 2, evens(T, L).

% Queries
% 
% evens([1, 2, 3, 4, 5, 6], X).

% -----

censor([], []).
censor([X|XT], ['***'|Res]) :- prohibit(X), censor(XT, Res).
censor([X|XT], [X|Res]) :- censor(XT, Res).

prohibit(pooface).
prohibit(divver).
prohibit(pancake).

% Queries
% 
% X = [tim, is, the, best].
% censor([tim, is, a, pooface], X).

