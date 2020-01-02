% Worksheet 18 - Sequential Maps with State

% The predicate runcode is defined such that for goal runcode(L, C , N, X), L is the input list, 
% C is the current constant, N is the current run length, and X is the output list.

% Checks for the null list, and writes the final result obtained from the state variables.
runcode([], C, N, [N*C]).
% Handles the case where the next element of the list, H, is the same as the current constant. 
% In this case, we recur on the tail of the input, incrementing the counter and keeping the same 
% constant.
runcode([H|T], H, N, Z) :- N1 is N+1, runcode(T, H, N1, Z).
% Handles the case where the second clause fails: when the next element of the input is different 
% from the current constant. In this case, an output term is constructed because we are finished 
% with the current run, and we recur on the tail, initialising the counter to 1 because we have 
% already encountered the first element of a run.
runcode([H|T], C, N, [N*C|Z]) :- H \== C, runcode(T, H, 1, Z).

runcode(X, Y) :- runcode(X, _, 0, Y), !.

% Queries
% 
% ?- runcode([a,a,b,b,a,c,c,c,d], [], 0, X).
% ?- runcode([a,a,b,b,a,c,c,c,d], _, 0, X).
% ?- runcode([a,a,b,b,a,c,c,c,d], C, 0, X).
% ?- runcode([12,2,2,w,3,3,s,s,s], C, 0, X).
