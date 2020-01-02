# Adventure

## [Adventure 02 - Simple Queries](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A3SIMPLE.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["adventure-02.pl"].`

3. Enter __trace__ mode: `trace.`

4. Query for all 'room's : `room(X).`

    > NB: Press `;` to get more results.

5. Dynamically add a new fact: `assert(location(pear, kitchen)).`

6. Query for everything in kitchen: `location(Thing, kitchen).`

7. Query for the location of everything:`location(Thing, Place).`

8. Disable __trace__ mode: `notrace.`

9. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
