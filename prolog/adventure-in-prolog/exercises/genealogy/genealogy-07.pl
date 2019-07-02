% female(Name)
female(mary).
female(muriel).
female(pip).
female(sue).
female(helen).
female(fiona).
female(emma).

% males(Name).
male(george).
male(walter).
male(alan).
male(rob).
male(tim).
male(richard).

% parenthood(Parent, Child).
parent(mary, pip).
parent(george, pip).
parent(mary, rob).
parent(george, rob).
parent(muriel, alan).
parent(walter, alan).
parent(pip, tim).
parent(alan, tim).
parent(pip, emma).
parent(alan, emma).
parent(pip, richard).
parent(alan, richard).
parent(rob, helen).
parent(rob, fiona).
parent(sue, helen).
parent(sue, fiona).

%marriages
spouse(george, mary).
spouse(walter, muriel).
spouse(alan, pip).
spouse(rob, sue).

% rules
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
daughter(X, Y) :- parent(X, Y), female(Y).
son(X, Y) :- parent(X, Y), male(Y).
grandparent(X, Y) :- parent(Z, Y), parent(X, Z).
grandfather(X, Y) :- parent(Z, Y), parent(X, Z), male(X).
grandmother(X, Y) :- parent(Z, Y), parent(X, Z), female(X).
ancestor(Ancestor, Descendant) :- parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :- parent(X, Descendant), ancestor(Ancestor, X).
descendant(Descendant, Ancestor) :- parent(Ancestor, Descendant).
descendant(Descendant, Ancestor) :- parent(Ancestor, X), descendant(Descendant, X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(Y).
sister(X, Y) :- sibling(X, Y), female(Y).
married(X, Y) :- spouse(X, Y). % marriage is a bidirectional realtionship.
married(X, Y) :- spouse(Y, X). % marriage is a bidirectional realtionship.
parent_in_law(X, Y) :- parent(X, Z), married(Y, Z).
father_in_law(X, Y) :- male(X), parent_in_law(X, Y). % More efficent to check gender first!
mother_in_law(X, Y) :- female(X), parent_in_law(X, Y). % More efficent to check gender first!
uncle(X, Y) :- parent(Z, X), sibling(Z, Y), male(Y).
uncle(X, Y) :- parent(Z, X), sibling(Z, Z1), married(Z1, Y), male(Y). % include uncle by marriage
aunt(X, Y) :- parent(Z, X), sibling(Z, Y), female(Y).
aunt(X, Y) :- parent(Z, X), sibling(Z, Z1), married(Z1, Y), female(Y). % include aunt by marriage.
cousin(X, Y) :- parent(Z, X), sibling(Z, Z1), parent(Z1, Y).
