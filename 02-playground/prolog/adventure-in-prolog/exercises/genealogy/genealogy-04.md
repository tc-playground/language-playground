# Genealogy

## [Genealogy 04 - Rules](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A5RULES.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["genealogy-04.pl"].`

3. Enter __trace__ mode: `trace.`

4. Find "tim's mother" - `mother(Person, tim).`

5. Find "tim's father" - `father(Person, tim).`

6. Find "alan's daughters" - `daughter(alan, Person).`

7. Find "pip's sons" - `son(pip, Person).`

8. Find "tim's grandparents" - `grandparent(X, tim).`

9. Find "tim's grandfathers" - `grandmother(X, tim).`

10. Find "tim's grandmothers" - `grandmother(X, tim).`

11. Disable __trace__ mode: `notrace.`

12. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
