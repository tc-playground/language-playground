# Fundamentals

## Rules

* A Prolog `program` is a `database` of interrelated `facts` and `rules`.

* The `rules` communicate with each other through `unification`, Prolog's built-in pattern matcher.

* The `rules` communicate with the user through `built-in predicates` such as write/1.

* The `rules` can be `queried` (called) individually from the listener.


## Control Flow

* The execution behavior of the rules is controlled by Prolog's built-in backtracking search mechanism.

* We can `force backtracking` with the built-in predicate fail.

* We can `force success` of a predicate by adding a final clause with dummy variables as arguments and no body.


## Programming

* Facts in the database (locations, doors, etc.) replace conventional data definition.

* The backtracking search (list_things/1) replaces the coding of many looping constructs.

* Passing of control through pattern matching (connect/2) replaces conditional test and branch structures.

* The rules can be tested individually, encouraging modular program development.

* Rules that call rules encourage the programming practices of procedure abstraction and data abstraction. (For example, look/0 doesn't know how list_things/1 works, or how the location data is stored.)