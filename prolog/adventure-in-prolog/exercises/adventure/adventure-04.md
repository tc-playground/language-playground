# Adventure

## [Adventure 04 - Rules](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A5RULES.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["adventure-04.pl"].`

3. Enter __trace__ mode: `trace.`

4. Find the food in the kitchen - `where_food(Thing, kitchen)`

5. Is the kitchen connected to the office? - `connect(kitchen, office).`

6. Is the office connected to the kitchen? - `connect(office, kitchen).`

7. What things are in the kitchen? - `list_things(kitchen).`

8. List all things - `list_things(_).`

9. List all connections - `list_connections(hall).`

10. Look in the desk - `look_in(desk).`

11. Look! - `look.`

12. Disable __trace__ mode: `notrace.`

12. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
