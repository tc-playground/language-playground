# Standard Python Modules

## stdin, stdout, stderr

1. __output__ - Produce formatted output on `stdout`.

    ```python
    print("Hello: ", person)
    print('Hello {}, this is {} speaking...'.format(person, machine))
    print(f'Hello {person}, this is {machine} speaking...')
    print('Hello {p}, this is {m} speaking...'.format(p=person, m=machine))
    print('Hello %s, this is %s speaking...'%(person, machine)) # Deprecated
    ```

2. __input__ - Consume input from `stdin`.

    ```python
    name = input('What is your name? ')
    print(f'Hello, {name}...')
    ```

---

## Command Line Arguments and Processes

1. __optparse module__ - Handle commandline options.

    1. Parse command line arguments:

        ```python
        import optparse
        parser = optparse.OptionsParser()
        parser.add_argument("--nice", type=str2bool, nargs='?',
                            const=True, default=False,
                            help="Activate nice mode.")
        (options, errors) = parser.parse_args()
        print(options.nice)
        ```

2. __subprocess module__ - Spawn new processes.

    1. Invoke `OS process`:

        ```python
        subprocess.run(["ls", "-l"])
        ```

    * `subprocess.call` - Legacy method.

    * [`subprocess` module](https://docs.python.org/3/library/subprocess.html)

