% Worksheet 11 - Multiple Choices

% When mapping over interger to produce the squares, the query will
% fail if a non-integer is encountered. This can be resolved by adding
% an additional clause to proceed with the computation.
% 
% NB: This will also backtrack to find meaningless solutions, unless
% a cut! is applied.
squint([], []).
squint([X|T],[Y|L]) :- integer(X), Y is X * X, squint(T, L).
squint([X|T], [X|L]) :- squint(T, L).

% Queries
% 
% ?- squint([1 , 3,5, goat], X).