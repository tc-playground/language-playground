% Worksheet 19: Scattered Maps with State

% The predicate coli is defined such that the goal coll(L,M) is a mapping
% from L to M in which M is in collected normal form:

% full mapping to iterarte through each item in the collection.
coll([], []).
coll([q(N,X)|R], [q(T,X)|R2]) :- collz(X, N, R, Q, T), coll(Q, R2).

% For a given type (X) and quantity (N) iterate through the tail (Q) and 
% find similar items of type (X) and add them to the quantity (N).
% 
% The result (R) is defined.
% The total ammount (T) for given type is defined.
%
% NB: N is the inital quantity and also an accumulator.
% 
% collz:1 - input type (X).
% collz:2 - input ammount and accumulator (N and M) - state.
% collz:3 - (remaining) input being processes (R) - state - predicates match (or dont match) on the head.
% collz:4 - output 'remaining seqeunce' to process (with no elements containing type X).
% collz:5 - output 'total ammunt' for type (X).

collz(_, N, [], [], N).
% If the head of the tail list matches the item we are processing, then increment
% the counter and do not readd the element to the lists to be processed.
collz(X, N, [q(Num,X)|R], Q, T) :- M is N + Num, collz(X, M, R, Q, T).
% If the Quantity X does not match then Q is re-added (kept).
collz(X, N, [Q|R], [Q|Qs], T) :- collz(X, N, R, Qs, T).

% Queries
% 
% coll([q(17, duck), q(15, goose), q(41, quail), q(12, goose), q(37, quail)], X).
% coll([q(1, a), q(1, a)], X).

% ---

% Non-TailRecursive version

collect([], []).
collect([q(N,X)|R], [q(T,X)|R3]) :-
    collect(R, R2),
    extract(q(M,X), R2, R3),
    T is M + N.

% Removes the processed items from the list.
extract(q(0,_), [], []).
extract(H, [H|T], T).
extract(X, [Y|T], [Y|T1]) :- X \== Y, extract(X, T, T1).

% Queries
% 
% collect([q(17, duck), q(15, goose), q(41, quail), q(12, goose), q(37, quail)], X).
% collect([q(1, a), q(1, a)], X).

% ---

% My version from scratch.


% Maps through the UnAggreagated elements one at a time and adds the aggregated result
% to the Aggregated elements.
% 
% aggregate(UnAggregated, Aggregated).
aggregate([], []).
aggregate([Next|Rest], [q(QuantityTotal, Type)|Aggregated]) :-
    q(QuantityAcc, Type) = Next,
    aggregate_type(Type, QuantityAcc, Rest, UnAggregated, QuantityTotal),
    aggregate(UnAggregated, Aggregated).

% Loops through the UnAggregated tail. If the elements matches the type then 
% increment the QuantityAcc and do not add re-add the element to the UnAggregated
% elements (effectively removing it).
% 
% aggregate_type(Type, Quantity, Rest, UnAggregated, QuantityTotal).
aggregate_type(_, QuantityTotal, [], [], QuantityTotal).
% Matched type.
aggregate_type(Type, QuantityAcc, [q(ThisQuantity,Type)|Rest], UnAggregated, QuantityTotal) :- 
    UpdatedQuantity is QuantityAcc + ThisQuantity, 
    aggregate_type(Type, UpdatedQuantity, Rest, UnAggregated, QuantityTotal).
% Unmatched type.
aggregate_type(Type ,QuantityAcc, [Next|Rest], [Next|UnAggregated], QuantityTotal) :- 
    aggregate_type(Type, QuantityAcc, Rest, UnAggregated, QuantityTotal).

% Queries
% 
% ?- aggregate([q(17, duck), q(15, goose), q(41, quail), q(12, goose), q(37, quail)], X).
% ?- aggregate([q(1, a), q(1, a)], X).
