% Chapter 2 - Arithmetic

coeff(A,X,B,Y) :- Y is A*X+B.
% Queries
% ?- coeff(2, 2, 2, 6).
% ?- coeff(1+7, 2*2, 4, Y).