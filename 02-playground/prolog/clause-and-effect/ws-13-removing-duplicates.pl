% Worksheet 13 - Removing Duplicates

% The goal setify(X, Y) maps input list X to output Y such that Y 
% contains only the members of X without any duplicates.

setify([], []).
setify([X|T], L) :- member(X, T), setify(T, L).
setify([X|T], [X|L]) :- setify(T, L).

% Queries
% 
% ?- setify([a,a,b,c,b], X).       % produces additional incorrect answers. needs cut.
% ?- setify([a,a,b,c,bj, [a,c,b]). % succeeds - due to correct ordering
% ?- setify([a,a,b,c,bj, [a,b,c]). % fails    - due to incorrect ordering