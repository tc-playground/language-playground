# Clause and Effect

* [Clause and Effect](https://www.springer.com/gp/book/9783540629719)

---

## Chapter 3

* `valuations` - Goals that produce a single output value given an input value.

* __Mappings__

    * Transform structure X into structure Y.

    * __Full Mapping__ - Maps each element of the input onto an element of the output.

        * `[1,2,3,4] -> [2,4,6,8]`

    * __Partial Mapping__ - Maps some elements of the input onto an element of the output. NB: __reduce__.

        * `[1,2,3,4] -> [2, 4]`
    
    * __Disjoint Mapping__ - Map elements of the input onto multiple structure:

        * `[1,2,3,4] -> [1, 3], [2, 4]`

    * __Sequential Mapping__ - For ordered structures, e.g. `run length encoding`:

        * `[a, a, t, 3, 3, 3, w, t, t, t, t, 3, 3 ] -> [2*a, 1*t, 3*3, 1*w, 4*f, 2*3]`
    
    * __Scattered Mapping__ - The output value can depend on any input values regardless of order. e.g. `frequency`:

        * `[a, a, t, 3, 3, 3, w, t, t, t, t, 3, 3] -> [2*a, 5*t, 5*3, 1 *w]`
    
---

## Chapter 04- Cut! 

* A predicate to give control over the backtracking flow of the executing program.

    1. Change a `non-deterministic` predicate into a `deterministic` predicate.

        ```
        membercheck(X, [X|_]) :- !.
        membercheck(X, [_|L]]) :- membercheck(X, L).
        ```

    2. To specify the `exclusion` of some cases by 'committing' to the current choice.

        ```
        max(X, Y, X) :- X >= Y, !.
        max(X, Y, Y) :- X < Y.
        ```

* In general, consider two clauses of predicate H of the form:

    ```
    Hl :- B1 , B2 , ... , Bi , !, Bj , ... , Bk.
    H2 :- Bm , ... , Bn.
    ```

    Such clauses would be checked if Prolog attempts to satisfy an H goal.
    Notice the cut between goals Bi and Bj. The goals in the sequence
    B1, ... , Bi may backtrack amongst themselves, and if B1 fails, then the
    second clause will be attempted. But now consider what happens if goal
    Bi succeeds. As soon as the 'cut' is crossed, the system is committed to
    the current choice of clause. All other choices are discarded. Goals
    Bj, ... , Bk may backtrack amongst themselves, but if goal B j fails, then
    the original H goal fails. The subsequent clauses will not be attempted.


* One way to domesticate the cut is to limit its use to special control predicates.

    * `->``;` - If-else.

        ```
        max2(X, V, Z) :- X >= V -> Z = X ; Z = V
        ```
    
    * `once` - The goal once(G) obtains and commits to the first solution of goal G.

        ```
        once(G) :- call(G), !.
        ```
    
    * `for` - The goal for(N, G) executes goal G, N times.

        ```
        for(O, G) :- !.
        for(N, G) :- N > 0, call(G), M is N - 1, for(M, G), !.
        ```