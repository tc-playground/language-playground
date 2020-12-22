% Worksheet 23 - Frequency Distribution

% Define the predicate freq such that the goal freq(L, S) succeeds for
% data list L and frequency list S.

freq(L, S) :- freq(L, [], S).
freq([], S, S).
freq([N|L], S1, S3) :- update(N, S1, S2), freq(L, S2, S3).

/* update(Key, BeforeList, AfterList) */
update(N, [], [1*N]).
update(N,[F*N|S], [F1*N|S]) :- !, F1 is F + 1.
update(N, [F*M|S], [1*N, F*M|S]) :- N < M, !.
update(N,[F*M|S], [F*M|S1]) :- N \== M, update(N, S, S1).

% Queries
% 
% ?- freq([3, 3, 2, 2, 1, 1, 2, 2, 3, 3], A).

