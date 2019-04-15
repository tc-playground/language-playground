# Prolog Tutorial

* https://www.youtube.com/watch?v=SykxWpFwMGs

---

## Introduction

* `Prolog` is a logic programming language.

---

## Commands

1. Run prolog repl: `prolog`

2. Prolog has a `write` predicate:

    ```
    write('Hello World'), nl, write('Let\'s Code!').
    ```

3. Prolog has a `halt` predicate to exit: `halt.`

4. Prolog can load a `knowledge base` as follows:

    1. `['some-kb-file.pl].`.

    2. `consult(2some-kb-file.pl').`

5. Prolog can display the contents of a knowledge base: `listing.`.

---

## Basic Syntax

1. Prolog has `atoms`. They begin with a lowercase character: `romeo`, `juliet`, etc.

2. Prolog has `predicates` (`facts`):

    ```
    loves(romeo, juliet).
    ```

6. Prolog has `rules`:

    ```
    loves(juliet, romeo) :- loves(romeo, juliet).
    ```

    > Romeo love Juliet `if` Juliet loves Romeo.

7. A set of `facts` and `rules` are called a `knowledge-base`. 

8. Prolog has `queries`: 

    ```
    ?- loves(romeo, juliet).
    true.   
    ```

9. Prolog has `variables`. They begin with a lowercase character:

    ```
    ?- loves(X, juliet).
    X = romeo.
    ```
