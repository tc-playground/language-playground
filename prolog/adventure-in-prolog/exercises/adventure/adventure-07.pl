% https://www.swi-prolog.org/FAQ/DynamicCode.html
:- (dynamic here/1).
:- (dynamic location/2).
:- (dynamic turned_on/1).
:- (dynamic turned_off/1).
:- (dynamic door/3).

% --- world ---

% Define initial state.
turned_off(flashlight).
here(kitchen).

% Define Rooms.
room(office).
room(kitchen).
room('dining room').
room(hall).
room(cellar).

% Define Room Door connections. door(Room, Room)
door(office, hall, open).
door(hall, 'dining room', open).
door('dining room', kitchen, open).
door(kitchen, cellar, open).
door(kitchen, office, open).

% Define location of objects location(Thing, Place).
location(desk, office).
location(apple, kitchen).
location(flashlight, desk).
location('washing machine', cellar).
location(nani, 'washing machine').
location(broccoli, kitchen).
location(crackers, kitchen).
location(computer, office).

% Recursivly determine if Thing 1 is contained in Thing2
is_contained_in(T1,T2) :-  
    location(T1,T2).
is_contained_in(T1,T2) :-
    location(X,T2),
    is_contained_in(T1,X).

% Define Edible things. edible(Food).
edible(apple).
edible(crackers).
tastes_yucky(broccoli).

% food location rules.
where_food(Thing, Room) :-
    location(Thing, Room),
    edible(Thing).
where_food(Thing, Room) :-
    location(Thing, Room),
    tastes_yucky(Thing).

% door connection rules.
connect(Room1, Room2, DoorState) :-
    door(Room1, Room2, DoorState).
connect(Room1, Room2, DoorState) :-
    door(Room2, Room1, DoorState).

% list things in a place. NB: This cannot be chained due to fail.
list_things(Place) :-
    location(X, Place),
    tab(2),
    write(X),
    nl,
    fail.
list_things(_).

% list connections in a place. NB: This can be chained.
list_connections(Place, DoorState) :-
    connect(Place, AnotherPlace, DoorState),
    tab(2),
    write(AnotherPlace),
    nl,
    fail.
list_connections(_, _).

% --- looking ---
%

% look at the current place.
look :-
    here(Place),
    write("You are in the "), write(Place), write("."), nl,
    write("You can see:"), nl, list_things(Place),
    (
        connect(Place, _, open) ->
        write("You can go to the:"), nl,
        list_connections(Place, open)
    ;   true -> true
    ),
    (
        connect(Place, _, closed) ->
        write("You will have to open the door to get to the:"), nl,
        list_connections(Place, closed)
    ;   true -> true
    ).


% look in a specified Thing.
look_in(Place) :-
    write('You see:'),
    nl,
    list_things(Place),
    fail.
look_in(_).

% --- navigation ---
%
goto(Place) :-
    can_go(Place),
    move(Place),
    look.

can_go(Place) :-
    here(X),
    connect(X, Place, open), !.
can_go(_) :-
    write('You can\'t get there from here.'),
    nl,
    fail.

move(Place) :-
    retract(here(_)),
    asserta(here(Place)).

% --- inventory ---
%
take(Thing) :-
    here(Place),
    can_take(Thing, Place),
    take_object(Thing), !. % cut here to stop backtrack to retract location.
can_take(Thing, Place) :-
    is_contained_in(Thing, Place), !.
can_take(Thing, _Place) :-
    write('There is no '),
    write(Thing),
    write(' here.'),
    nl,
    fail.

take_object(Thing) :-
    location(Thing, Place),
    retract(location(Thing, Place)),
    asserta(have(Thing)),
    write("You have taken"),
    tab(1),
    write("the"),
    tab(1),
    write(Thing),
    write("."),
    nl, !.

% 1- Write put/1 which retracts a have/1 clause and asserts a location/2 clause in the current room.
put(Thing) :-
    retract(have(Thing)),
    here(Place),
    assertz(location(Thing, Place)),
    write("You have dropped"),
    tab(1),
    write("the"),
    tab(1),
    write(Thing),
    write("."),
    nl, !.

% 2- Write inventory/0 which lists the have/1 things.
inventory :-
    current_predicate(have/1), % check if we have any have/1 predicates.
    write("You have: "),
    nl,
    have(Thing),
    tab(2),
    write(Thing),
    nl,
    fail.
inventory.

turn_on(Thing) :-
    % todo - be near thing.
    assertz(turned_on(Thing)),
    retract(turned_off(Thing)), !.

turn_off(Thing) :-
    % todo - be near thing.
    assertz(turned_off(Thing)),
    retract(turned_on(Thing)), !.


open_door(Room) :-
    here(Here),
    do_open_door(Here, Room).

close_door(Room) :-
    here(Here),
    do_close_door(Here, Room).

do_open_door(Room1, Room2) :-
    (
        door(Room1, Room2, closed) ->
        retract(door(Room1, Room2, closed)),
        assertz(door(Room1, Room2, open))
    ;   true -> true
    ),
    (
        door(Room2, Room1, closed) ->
        retract(door(Room2, Room1, closed)),
        assertz(door(Room2, Room1, open))
    ;   true -> true
    ),
    !.

do_close_door(Room1, Room2) :-
    (
        door(Room1, Room2, open) ->
        retract(door(Room1, Room2, open)),
        assertz(door(Room1, Room2, closed))
    ;   true -> true
    ),
    (
        door(Room2, Room1, open) ->
        retract(door(Room2, Room1, open)),
        assertz(door(Room2, Room1, closed))
    ;   true -> true
    ),
    !.
