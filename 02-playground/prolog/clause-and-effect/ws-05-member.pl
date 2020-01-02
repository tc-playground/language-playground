% Worksheet 5 - Member

% member(X, [X|T]).
% member(X, [H|T]) :- member(X,T).
member(X, [X|_]).
member(X, [_|T]) :- member(X,T).

% Queries
% 
% ?- member(john, [paul, john]).
% ?- member(X, [paul, john]).
% ?- member(joe, [marx, darwin, freud]).
% ?- member(foo, X).

mystery(X, A, B) :- member(X, A), member(X, B).

% Queries 2
% 
% ?- mystery(a, [b,c,a] , [p,a,I]).
% ?- mystery(b, [b,l,u,e], [y,e,l,l,o,wj).
% ?- mystery(X, [r,a,p,i,d], [a,c,t,i,o,nj).
% ?- mystery(X, [w,a,l,n,u,t], [c,h,e,r,r,y]).