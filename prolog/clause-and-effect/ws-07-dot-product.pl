% Worksheet 7 - Inner-Product / Dot-Product

% recursive dot-product.
inner([], [], 0).
inner([A|As], [B|Bs], N) :- 
    inner(As, Bs, Ns), 
    N is Ns + (A * B).

% tail-recursive dot-product with accumulator.
inner_acc(A, B, N) :- dotaux(A, B, 0, N).
dotaux([], [], V, V).
dotaux([A|As], [B|Bs], N, Z) :- 
    N1 is N + (A * B), 
    dotaux(As, Bs, N1, Z).

% Qeuries
% 
% inner([1,2,3],[1,2,3], X).
% inner_acc([1,2,3],[1,2,3], X).