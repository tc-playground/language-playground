# Customer Order system

## [Customer Order System 01 - Facts](http://pages.cs.wisc.edu/~fischer/cs538.s00/prolog/A2FACTS.HTM)

1. Run `prolog` to start a shell.

2. Load the program: `["customer-order-system-01.pl"].`

3. Query for all of each item:

    * 'customer's : `customer(Name, City, CreditRating).`

    * 'items' : `item(ID, Name, ReorderLevel).`

    * 'stock' : `stock(ID, Quantity).`
    
    > NB: Press `;` to get more results.

4. Quey 'items' and 'stock' levels : `stock(ID, Quantity), item(ID, Name, ReorderLevel).`

5. Actions `ctrl-c ctrl-c` :

    ```
    Action (h for help) ? Options:
    a:           abort         b:           break
    c:           continue      e:           exit
    g:           goals         s:           C-backtrace
    t:           trace         p:             Show PID
    h (?):       help
    ```

6. Exit the session : `halt.`.

