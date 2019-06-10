# Adventure

## [Adventure 03 - Compound Queries](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A4COMQRY.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["adventure-03.pl"].`

3. Enter __trace__ mode: `trace.`

4. Find "all edible things in the kitchen" - `location(Thing, kitchen), edible(Thing).`

5. Find "all Things in the Rooms with a door from the kitchen" - `door(kitchen, Room), location(Thing, Room).`

6. Print "all Things in the kitchen" - `location(Thing, kitchen), write(Thing) ,nl, fail.`

7. Print "all Things in the Rooms with a Door from the kitchen" - `door(kitchen, R), write(R), nl, location(T,R), tab(3), write(T), nl, fail.`

8. Disable __trace__ mode: `notrace.`

9. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
