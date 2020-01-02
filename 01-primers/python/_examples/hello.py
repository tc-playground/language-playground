#!/usr/bin/env python3
import subprocess

# Requires Python3

person = 'Unknown User'
machine = 'The Computer'

print('Hello %s, this is %s speaking...'%(person, machine))
print(f'Hello {person}, this is {machine} speaking...')
print('Hello {}, this is {} speaking...'.format(person, machine))
print('Hello {p}, this is {m} speaking...'.format(p=person, m=machine))

name = input(f'What is your name {person}? ')

print(f'Hello, {name}...\n')
print('Here are your files:\n')
subprocess.run(["ls", "-l"])

print()
print(f'Bye, {name}')
