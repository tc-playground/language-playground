# Adventure

## [Adventure 07 - Recursion](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A8RECURS.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["adventure-07.pl"].`

3. Enter __trace__ mode: `trace.`

4. What is contained in the office? : `is_contained_in(X, office).`

5. Do some stuff: 

    ```
    take(flashlight).
    take(apple).
    inventory.
    look.
    goto(office).
    look.
    inventory.
    take(flashlight).
    ```

6. Disable __trace__ mode: `notrace.`

7. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
