# Prolog Jargon

## Programs

* A Prolog `program` is a a Prolog `database`.

---

## Predicates

* A Prolog `program` is composed of `predicates`.

    > procedures, record types, relations.

* `predicate` syntax:

    ```
    predicate(arg1, arg2,...,argN).
    ```

* Each `predicate` is defined by it `name` and `arity`.

* A `predicates` arguments must be valid `terms`. Basic Prolog `terms` are:

    * `integer` - A number. Also floats and other numeric types.

    * `atom` - A string constant beginning with a lowercase letter.

    * `variable` - A string beginning with an uppercase letter or underscore.

    * `structure` - Complex `terms`.

* Two `predicates` with the same `name` and different `arity` are considered to be different `predicates`.

* Each `predicate` in a program is defined by the existence of one or more `clauses` in the database.

---

## Clauses

* A clause can either be a `fact` or a `rules`.

---

## Facts

* `Facts` represent a record in a database.

* __Syntax__

    ```
    predicate(arg1, arg2,...,argN).
    ```

* __Example__

    ```
    human(socrates).
    male(socrates).
    ```

---

## Queries

* A Prolog `listener` can be used to execute `queries` against the `program`.


* __Example__

    ```
    ?- human(X).
    ```

---

## Goals

* A `goal` is a `query pattern`.

* When executing a `query pattern` against a `program`, Prolog tries to reach (`prove`) the `goal`.  

* For `facts`:

    * If there is a `fact` that matches the `goal`, then the `query` `succeeds` and the listener responds with `yes.` 

    * If there is no `fact` that matches the `goal`, then the `query` `fails` and the listener responds with `no.`

* Prolog's pattern matching is called `unification`.

---

## Unification

* In the case where the `database` contains only `facts`, `unification` succeeds if the following three conditions hold:

    * The predicate named in the goal and database are the same.
    
    * Both predicates have the same arity.
    
    * All of the arguments are the same.

---

## Variable Binding

* After successful `unification`, a logical variable takes on the value of the term it was matched with. This is called `binding` the variable. 

* __Example__

---

## Backtracking


