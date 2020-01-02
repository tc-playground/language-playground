% Worksheet 22 - Ordered Search Trees

% The tree consists of nodes n(A,L,R), where A is the (integer) item to be stored in the tree, 
% L is a tree containing items smaller than A, and R is a tree containing items larger than A.

% 1. Insertion into a nil tree: just grow a new leaf.
% 2. The item is less than current node: just recur on the left-hand branch.
% 3. The item is greater than current node: just recur on the right-hand branch.
% 4. The item is the same as the current node: just return. The item has already been inserted.


% INCORRECT. Nothing is building the new tree!
% 
% insert(l, [], n(l, [],[])).
% insert(l, n(N, L, _), T) :- I < N, insert(I, L, T).
% insert(l, n(N ,_, R), T) :- I > N, insert(I,R,T).
% insert(l, n(l, _, _), _).

insert(I, [], n(I, [], [])).
insert(I, n(N, L, R), n(N, L1, R)) :- I < N, !, insert(I, L, L1).
insert(I, n(N, L, R), n(N, L, R1)) :- I > N, !, insert(I, R, R1).
insert(I, n(I, L, R), n(I, L, R)).

lookup(I, n(I, [], [])) :- !.
lookup(I, n(N, L, _)) :- I < N, !, lookup(I, L).
lookup(I, n(N, _, R)) :- I > N, !, lookup(I, R).

% Queries 
% 
% ?- insert(2, [], X).
% ?- insert(5, _, X1), insert(3, X1, X2), insert(7, X2, Y).
% ?- insert(5, [], X1), insert(3, X1, X2), insert(7, X2, Y).
