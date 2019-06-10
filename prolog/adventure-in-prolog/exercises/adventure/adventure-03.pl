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

% Define location of objects location(Thing, Room).
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

% Define initial state.
turned_off(flashlight).
here(kitchen).