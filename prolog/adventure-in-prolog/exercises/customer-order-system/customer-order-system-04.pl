% customer(Name, City, CreditRating).
customer("Bob", "Bristol", "Good").
customer("Fred", "Bristol", "Bad").
customer("Alice", "London", "Excellant").
customer("Waltero", "Bristol", "Good").

% item(ID, Name, ReorderLevel).
item("1", "Cheese",15).
item("2", "Bread", 25).
item("3", "Pickle", 5).

% stock(ID, Quantity).
stock("1", 20).
stock("2", 50).
stock("3", 10).

% rules
item_quantity(Name, Quantity) :- item(ID, Name, _), stock(ID, Quantity).
inventory_report() :-
    item_quantity(Name, Quantity),
    % we need to 'fail' to force back-tracking to get all results...
    write(Name), tab(1), write(":"), tab(1), write(Quantity), nl, fail.
inventory_report(). % we need an automatically suceeding rule to hide the fail.

good_customer(X) :- customer(X, _, "Good").
good_customer(X) :- customer(X, _, "Excellant").
