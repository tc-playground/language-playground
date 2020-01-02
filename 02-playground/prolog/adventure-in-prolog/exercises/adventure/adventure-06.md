# Adventure

## [Adventure 06 - Managing Data](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A7MANAGE.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["adventure-06.pl"].`

3. Enter __trace__ mode: `trace.`

4. Can we go to the hall? : `can_go(hall).`

5. Do some stuff:

    ```
    look.
    inventory.
    take(apple).
    inventory.
    look.
    goto(cellar).
    look.
    put(apple).
    inventory.
    look.
    take('washing machine').
    inventory.
    ```
6. Do some more stuff.

    ```
    look.
    close_door(cellar).
    look.
    goto(cellar).
    open_door(cellar).
    goto(cellar).
    look.
    close_door(kitchen).
    look.
    goto(kitchen).
    open_door(kitchen).
    goto(kitchen).
    look.
    ```

7. Disable __trace__ mode: `notrace.`

8. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
