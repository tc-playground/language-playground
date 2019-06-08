# Genealogy

## [Genealogy 01 - Simple Queries](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A3SIMPLE.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["genealogy-02.pl"].`

3. Enter __trace__ mode: `trace.`

4. Confirm 'walter' is a parent of 'alan' : `parent(walter, alan).`

5. Find `alan`s parents : `parent(Parent, alan).` 

6. Find `alan`s children : `parent(alan, Child).`

7. List all parents and children : `parent(Parent, Child).`

8. Disable __trace__ mode: `notrace.`

9;. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
