# Python Basic Program Structures

## Header and Main

1. __Script Header__

    1. Python `script header`:

        ```python
        #!/usr/bin/env python
        ```

2. __Interpreter Entrypoint__

    1. When python interpreter executes a file directly it defines a variable `__name__` whose value is set as `__main__`.
    
    2. __Define__ a check to determine if the file has been executed directly by the interpreter:

        ```python
        if __name__ == '__main__':
            main()
        ```

        1. `main()` will be executed when the python interpreter _executes the file directly_.

        2. `main()` will not be executed when the python interpreter _imports the file as a module_.

3. __Command Line Arguments__

    1. `sys.argv` - The commandline arguments are stored in a `string array`.

    2. `sys.argv[0]` - The first argument is the name of the python script that was the entrypoint.

    3. `argparse` - Is a standard module to help with processing commandline arguments.

---

## Constants, Variables, Functions, and, Classes

---

## Modules and Imports

1. __List__ the avilable modules via the `repl`: `help('modules')`

2. __Install__  a module *via `pip3`): `pip3 install ${package_name}`

    * Often this is done in the context of an active `virtual environment`.

3. __Import__ a module.

    ```python
    import subprocess
    ```

