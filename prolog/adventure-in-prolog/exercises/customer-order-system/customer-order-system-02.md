# Customer Order system

## [Customer Order System 02 - Simple Queries](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A3SIMPLE.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["customer-order-system-02.pl"].`

3. Enter __trace__ mode: `trace.`

4. Find customers in a given city: `customer(Name, "Bristol", _).`

5. Find customers with a given credit rating : `customer(Name, _, "Good").`

6. Confirm a given customer's credit rating : `customer("Bob", _, "Good").`

7. Find the customers in a given city with a given credit rating : `customer(Name, "Bristol", "Good").`

8. Find the reorder quantity for a given item : `item(_, "Cheese", ReorderLevel).`

9. Find the item number for a given item name : `item(ID, "Bread", _).`

10. Find the inventory level for a given item number: `stock("3", InvLevel).`

11. Disable __trace__ mode: `notrace.`

12. Exit the session : `halt.`

---

## References

* [SWI Debugging](http://www.swi-prolog.org/pldoc/man?section=debugging)

* [SWI Debug/Trace](http://www.swi-prolog.org/pldoc/man?section=debugger)
