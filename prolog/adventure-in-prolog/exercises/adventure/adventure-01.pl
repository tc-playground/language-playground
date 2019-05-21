% Define Rooms.
room(office).
room(kitchen).
room('dining room').
room(hall).
room(cellar).

% Define Room Doorconnections. door(Room, Room)
door(office, hall).
door(hall, 'dining room').
door('dining room', kitchen).
door(kitchen, cellar).
door(kitchen, office).

% Define Edible things. edible(Food).
edible(apple).
edible(crackers).
tastes_yucky(broccoli).

% Define initial state.
turned_off(flashlight).
here(kitchen).