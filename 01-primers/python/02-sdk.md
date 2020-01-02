# Python Tool Chain

---

## Python Installation

1. Install `python` or `python3` via the OS package manager as appropriate

    ```bash
    sudo apt install python3
    ```

---

## Virtual Environments

1. __virtualenv__ - Create and manage `virtual environments`.

    1. __Install__: `sudo apt install python3-venv`

    2. __Create__ : `python3 -m venv venv`

    3. __Start__  : `source venv/bin/activate`

    4. __Stop__  : `deactivate`

> A virtual environment will allow you to use isolated python runtimes, libraries, linters, etc.

---

## Python Package Managers

1. `pip3` package manager 

    ```bash
    sudo apt install python3-pip
    ```
---

## Linters

1. __flake8__

    1. A code linter. Many other available: `pylint`, etc.
