# Genealogy

## [Genealogy 03 - Compound Queries](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A4COMQRY.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["genealogy-03.pl"].`

3. Enter __trace__ mode: `trace.`

4. Find "tim's mother" - `parent(Person, tim), female(Person).`

5. Find "tim's father" - `parent(Person, tim), male(Person).`

6. Find "alan's daughters" - `parent(alan, Person), female(Person).`

7. Find "pip's sons" - `parent(pip, Person), male(Person).`

8. Does the order of clauses affect a query? 

    * `parent(X, tim), female(X).` vs `female(X), parent(X, tim).`

    * It can affect the __efficiency__ of the query - _procedural interpretation_.

    * It does not affect the result of the query - _logical interpretation_.

9. Find "tim's grandparents" - `parent(Parent, tim), parent(GrandParent, Parent).`

10. Find "tim's grandfathers" - `parent(Parent, tim), parent(GrandParent, Parent), male(GrandParent).`

11. Find "tim's grandmothers" - `parent(Parent, tim), parent(GrandParent, Parent), female(GrandParent).`

12. Disable __trace__ mode: `notrace.`

13. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
