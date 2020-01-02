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
stock("2", 15).
stock("3", 10).

% rules
item_quantity(Name, Quantity) :- item(ID, Name, _), stock(ID, Quantity).
inventory_report() :-
    item_quantity(Name, Quantity),
    % we need to 'fail' to force back-tracking to get all results...
    write(Name), tab(1), write(":"), tab(1), write(Quantity), nl, fail.
inventory_report(). % we need an automatically suceeding rule to hide the fail.


% For the query: valid_order("Bob", "Cheese", 5).
% 
% Two results are returned: Firstly, the correct result, and then a fail
% due to backtracking to the second `good_customer`clause.
% 
% This can be fixed by using a '!' cut after `good_customer(Customer)`
% 
% good_customer(X) :- customer(X, _, "Good").
% good_customer(X) :- customer(X, _, "Excellant").
% 
% valid_order(Customer, Item, Quantity) :-
%     good_customer(Customer),
%     item(ID, Item, _),
%     stock(ID, Available),
%     Available >= Quantity.

good_customer(X) :- 
    customer(X, _, "Good"); 
    customer(X, _, "Excellant").

valid_order(Customer, Item, Quantity) :-
    good_customer(Customer), !,
    item(ID, Item, _),
    stock(ID, Available),
    Available >= Quantity.

reorder(Item) :-
    item(ID, Item, ReorderLevel),
    stock(ID, Quantity),
    Quantity < ReorderLevel,
    ReorderAmount is ReorderLevel - Quantity,
    write(Item), tab(1), write("inventory is low."), 
    tab(1),
    write("Please re-order at least"), tab(1), write(ReorderAmount), tab(1), write("items."), 
    nl.
