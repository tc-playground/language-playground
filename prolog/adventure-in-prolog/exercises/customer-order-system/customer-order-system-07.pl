% https://www.swi-prolog.org/FAQ/DynamicCode.html
:- (dynamic stock/2).

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
    write(Name), tab(1), write(":"), tab(1), write(Quantity), nl, fail.
inventory_report(). 

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

update_inventory(Name, Quantity) :- 
    item(ID, Name,_),
    stock(ID, CurrentQuantity),
    NewQuantity is CurrentQuantity + Quantity,
    retract(stock(ID, CurrentQuantity)),
    asserta(stock(ID, NewQuantity)).

order :-
    write("Enter customer name:"),nl,
    read(Customer),
    write("Enter required item:"),nl,
    read(Item),    
    write("Enter required quantity:"),nl,
    read(Quantity),
    valid_order(Customer, Item, Quantity),
    assertz(order(Customer, Item, Quantity)),
    write("Processing order:"), tab(1), write(Customer), tab(1), write(Item), tab(1), write(Quantity), nl,
    update_inventory(Item, 0 - Quantity),
    % write("Check new inventory levels."), nl,
    reorder(Item),
    !.

    
