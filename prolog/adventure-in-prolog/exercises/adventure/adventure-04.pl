% Define Rooms.
room(office).
room(kitchen).
room('dining room').
room(hall).
room(cellar).

% Define Room Door connections. door(Room, Room)
door(office, hall).
door(hall, 'dining room').
door('dining room', kitchen).
door(kitchen, cellar).
door(kitchen, office).

% Define location of objects location(Thing, Place).
location(desk, office).
location(apple, kitchen).
location(flashlight, desk).
location('washing machine', cellar).
location(nani, 'washing machine').
location(broccoli, kitchen).
location(crackers, kitchen).
location(computer, office).

% Define Edible things. edible(Food).
edible(apple).
edible(crackers).
tastes_yucky(broccoli).

% food location rules.
where_food(Thing, Room) :- location(Thing, Room), edible(Thing).
where_food(Thing, Room) :- location(Thing, Room), tastes_yucky(Thing).

% door connection rules.
connect(X,Y) :- door(X,Y).
connect(X,Y) :- door(Y,X).

% list things in a place. NB: This cannot be chained due to fail.
list_things(Place) :-  
    location(X, Place),
    tab(2),
    write(X),
    nl,
    fail.

% list connections in a place. NB: This can be chained.
list_connections(Place) :-
    connect(Place, AnotherPlace),
    tab(2),
    write(AnotherPlace),
    nl,
    fail.
list_connections(_).

% look at the current place.
look :-
    here(Place),
    write('You are in the '), write(Place), write('.'), nl,
    write('You can see:'), nl,
    list_things(Place),
    write('You can go to:'), nl,
    list_connections(Place).

% look in a specified Thing.
look_in(Place) :- 
    write('You see:'), nl,
    list_things(Place),
    fail.
look_in(_).


% Define initial state.
turned_off(flashlight).
here(kitchen).