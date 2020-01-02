% Worksheet 8 - Maximum of a List

max([], A, A).
max([H|T], A, M) :- 
    H > A, max(T, H, M).
max([H|T], A, M) :-
    H =< A, max(T, A, M).

% Queries
% 
% NB: We need to specify an initial value for the accumulator.
% 
% ?- max([1,2,3,4,5], 0, X).
% ?- max([1,2,3,12,4,5], 0, X).


find_max([H|T], X) :- max(T, H, X).

% Queries
% 
% ?- find_max([1,2,3,4,5], X).


min([], A, A).
min([H|T], A, M) :- 
    H < A, min(T, H, M).
min([H|T], A, M) :-
    H >= A, min(T, A, M).

find_min([H|T], X) :- min(T, H, X).

% Queries
% 
% ?- find_min([1,2,3,-12,4,5], X).


minmax([], Min, Max, Min, Max).
minmax([H|T], MinA, MaxA, Min, Max) :- 
    H < MinA, minmax(T, H, MaxA, Min, Max).
minmax([H|T], MinA, MaxA, Min, Max) :- 
    H >= MaxA, minmax(T, MinA, H, Min, Max).
minmax([_|T], MinA, MaxA, Min, Max) :- 
    minmax(T, MinA, MaxA, Min, Max).

find_minmax([H|T], Min, Max) :- minmax(T, H, H, Min, Max).

% Need a cut to prevent backtracking,
% find_minmax([H|T], Min, Max) :- minmax(T, H, H, Min, Max),!.

% Queries
% 
% ?- find_minmax([1, 10, 2, 3, 4, -1, 5], Min, Max).