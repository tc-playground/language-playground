# Python Primer

## Introduction

* `Python` has two main versions `Python3`, and, the _deprecated_ `Python 2`.

* `Python` is an interpretted language, but, can be compiled.

* `Python` has a `REPL`.

* `Python` has `Procedural`, `Object Oriented`, and `Functional` elements.

* `Python` has `named parameters`.

* `Python` can use the `pip3` tool to manage library `modules`. NB: `pip` for Python 2.

* `Python` can use `venv` virtual environments to manage specific library `module` versions.

---

## Python Installation

1. Install `python` or `python3` via the OS package manager as appropriate

    ```bash
    sudo apt install python3
    ```

2. `Python` package modules will be installed 

    ```bash
    sudo apt install python3-pip
    ```
---

## Python Basic Tool Chain

1. __virtualenv__

    1. Create a `virtual environnent`:

        ```bash
        # sudo apt install python3-venv
        python3 -m venv venv
        source venv/bin/activate
        ```

2. __flake8__

    1. A code linter. Many other available: `pylint`, etc.

---

## Python Basic Scripting

1. __Script Header__

    1. Python `script header`:

        ```python
        #!/usr/bin/env python
        ```

2. __Entrypoint__

    1. Define `__main__` function hook:

        ```python
        if __name__ == '__main__':
            main()
        ```
    
    2. This will be executed when the python interpreter executes the file directly.

    3. This will not be executed when the python interpreter imports the file as a module.

    > When python interpreter starts executes a file directly it defines a variable __name__ whose value is set as __main__.


1. __output__ - Produce formatted output on `stdout`.

    ```python
    print(f'Hello {person}, this is {machine} speaking...')
    print('Hello {}, this is {} speaking...'.format(person, machine))
    print('Hello {p}, this is {m} speaking...'.format(p=person, m=machine))

    print('Hello %s, this is %s speaking...'%(person, machine)) # Deprecated
    ```

2. __input__ - Consume input from `stdin`.

    ```python
    name = input('What is your name? ')
    print(f'Hello, {name}...')
    ```

3. 


---

## Python Modules

1. __List__ - List the avilable modules

    ```python
    help('modules')
    ```

1. __Import__ - Import a module.

    ```python
    import subprocess
    ```

---

## Selected Python Modules

1. __subprocess module__ - Spawn new processes.

    1. Invoke `OS process`:

        ```python
        subprocess.run(["ls", "-l"])
        ```

    * `subprocess.call` - Legacy method.

    * [`subprocess` module](https://docs.python.org/3/library/subprocess.html)

2. __optparser module__ - Handle commandline options.

    1. Parse command line arguments:

        ```python
        import optparse
        parser = optparse.OptionsParser

        ```

---

## References

* [Python - Home](https://www.python.org/)

* [venv - Docs](https://docs.python.org/3/library/venv.html)