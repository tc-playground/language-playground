% Partial Knowledgebase
pet(dog) :- size(medium), noise(woof).
pet(cat) :- size(medium), noise(meow).
pet(mouse ):- size(small), noise(squeak).

% assert(size(medium)).
% assert(noise(meow)).

% Use `ask` predicate to obtain missing AV pair rules. 
size(X) :- ask(size, X).
noise(X) :- ask(noise, X).

ask(Attr, Val):-
    % prompt(_, ''), % change input prompt.
    % The swi-prolog writer requires a 'nl' or 'flush_output' to write this in-situ.
    write(Attr),tab(1),write(Val),tab(1),write('(yes/no)'),write('?'),nl,
    % The swi-prolog reader requires the input is termianted with a '.<CR>'
    read(X),
    X = yes.
