% Worksheet 16 - Multiple Disjoint Partial Maps 2

% `firstcol` is a partial map that take a matrix and extracts the 
% first element of each row (the first column) and returns it as a
% list. 
% 
% ?- firstcol([[1,2,3],[4,5,6],[7,8,9]], X).
% X = [1, 4, 7].
firstcol([], []).
firstcol([[H|_]|R], [H|Hs]) :- firstcol(R, Hs).

% `nextcols` is a partial map that takes a matrix and extracts 
% the remaining matrix after excluding the first row.
% 
% ?- nextcols([[1,2,3],[4,5,6],[7,8,9]], X).
% X = [[2, 3], [5, 6], [8, 9]].
nextcols([], []).
nextcols([[_|T]|R], [T|Ts]) :- nextcols(R, Ts).

% `transpose` is a full disjoint map that first that recursively splits 
% off each leading column of a matrix into a structure, it then creates 
% a new matrix from the remainder.
% 
% NB: This is inefficent as it parses the matrix twice.
% 
% ?- transpose([[1,2,3],[4,5,6],[7,8,9]], X).
% X = [[1, 4, 7], [2, 5, 8], [3, 6, 9]] .
transpose([[]|_], []).
transpose(R, [H|C]) :- firstcol(R, H), nextcols(R, T), transpose(T, C).

% Query
% 
% ?- transpose([[1,2,3],[4,5,6],[7,8,9]], X).
% ?- transpose([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], X).

% ---

% An optimised version of the matrix ranspose. 
% 
transpose2([[]|_], []).
transpose2(R, [H|C]) :- chopcol(R, H, T), transpose2(T, C).

% Only pass through the matrix once.
chopcol([], [], []).
chopcol([[H|HT]|T], [H|C], [HT|M]) :- chopcol(T, C, M).
% The longer predicate form:
% 
% chopcol(R, C, M) :- 
%     [[H|HT]|T] = R,
%     [H|C1] = C, 
%     [HT|M1] = M,
%     chopcol(T, C1, M1).



