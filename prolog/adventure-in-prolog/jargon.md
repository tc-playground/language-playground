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

* A Prolog `listener` can be used to make `queries` against the `program`.

---

## Backtracking

---

## Unification