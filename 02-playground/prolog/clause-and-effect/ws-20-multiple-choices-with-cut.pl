% Worksheet 20 - Multiple Choice with Cut


% Square Integers.
squint([], []).
squint([X|T], [Y|L]) :- integer(X), !, Y is X * X, squint(T, L).
squint([X|T], [X|L]) :- squint(T, L).

% Filter Evens.
evens([], []).
evens([X|T], [X|L]) :- 0 is X mod 2, !, evens(T, L).
evens([_|T], L) :- evens(T, L).

% Remove duplicates.
setify([], []).
setify([X|T], L) :- member(X, T), !, setify(T, L).
setify([X|T], [X|L]) :- setify(T, L).

% Set Difference.
sd([], _, []).
sd([E|S1], S2, S3) :- membercheck(E, S2), !, sd(S1, S2, S3).    % If E is in the target set, cut to prevent backtracking and try the next E.
sd([E|S1], S2, [E|S3]) :- sd(S1, S2, S3).                       % If E is not the target set match here and add E to the result.

membercheck(X, [X|_]) :- !.
membercheck(X, [_|L]) :- membercheck(X, L).

% Queries
% 
% ?- squint([1,2,3,4,5], X).
% ?- evens([1,2,3,4,5], X).
% ?- setify([1,1,2,2,3,3,4,4,5,5], X).
% ?- setify(X, [1,1,2,2,3,3,4,4,5,5]). Infintie Loop! Out of stack!
% ?- sd([1,2,3,4,5], [3,4,5,6,7,8], X).
% ?- membercheck(b, [a,b,c,d]).
% ?- membercheck(f, [a,b,c,d]).