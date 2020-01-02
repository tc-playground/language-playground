% Worksheet 6 - Length of a List

% Recursive list_length.
list_length([], 0).
list_length([_|T], N) :- 
    list_length(T, Nt), 
    N is Nt + 1.

% Recursive list_length with accumulator to allow tail-end
% recursion optimization.  
acc_list_length(L, N) :- 
    accumulate(L, 0, N).

accumulate([], A, A).
accumulate([_|T], A, N) :- 
    A1 is A + 1, 
    accumulate(T, A1, N).

% Queries
%
% In the first clause of accumulate, why must we never replace the A variables by anonymous variables? 
%
% ?- length([apple,pear], N).
% ?- length(L, 3).
% ?- length([alpha], 2).

% sum_list/2
% The length procedure can be modified to give a sum procedure, defined
% The goal sum(L, N) succeeds if L is a list of integers and N is their sum.
sum_list([], 0).
sum_list([H|T], N) :- 
    sum_list(T, ST),
    N is ST + H.

% accumlator version,
acc_sum_list(L, N) :- 
    acc_sum(L, 0, N).
acc_sum([], Acc, Acc).
acc_sum([H|T], Acc, N) :-
    AccN is Acc + H,
    acc_sum(T, AccN, N).

% Queries 2
% 
% sum_list(1, 2, 3).
% acc_sum_list(1, 2, 3).
    
    
