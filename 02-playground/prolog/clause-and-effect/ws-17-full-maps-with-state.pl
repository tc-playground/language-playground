% Worksheet 17 - Full maps with State

% The pattern is always the same. A base case is needed to map the null
% list to the null list. A recursive case is needed to match the input head
% and tail, transform the input head to the output head, update the state,
% and recur on the input tail, new state, and output tail.

ms([], _, []).
ms([H|T], Acc, [C|L]) :- C is H + Acc, ms(T, C, L).

mapsum(X,Y) :- ms(X,0,Y).

% Queries
% 
% ?- mapsum([1,2,3,4,5], X).

% ----

make_enum(X, Y) :- enum(X, 0, Y).

enum([], Acc, Acc).
enum([H|T], Acc, [enum(IDX, H)|Y]) :- IDX is Acc + 1, enum(T, IDX, Y).

% Queries
% 
% ?- make_enum([cabbage, beet, carrot, bean, radish, beet], X).
