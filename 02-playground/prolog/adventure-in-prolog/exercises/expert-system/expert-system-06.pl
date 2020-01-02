% https://www.swi-prolog.org/FAQ/DynamicCode.html
:- (dynamic known/3).

% Partial Knowledgebase
pet(dog) :- size(medium), noise(woof).
pet(cat) :- size(medium), noise(meow).
pet(mouse) :- size(small), noise(squeak).
pet(parrot) :- size(small), noise(squawk).

% Use `ask` predicate to obtain missing AV pair rules. 
size(X) :- ask(size, X).
noise(X) :- ask(noise, X).

ask(Attr, Val) :-
    known(Attr, Val, yes), !.
ask(Attr, Val) :-
    known(Attr, Val, no), !, fail.  % If no, then no need to check the additional predicates.
% ask(Attr, Val) :-
%     not(known(Attr, Val, _)).
ask(Attr, Val) :-
    % prompt(_, ''), % change input prompt.
    % The swi-prolog writer requires a 'nl' or 'flush_output' to write this in-situ.
    write(Attr),tab(1),write(Val),tab(1),write('(yes/no)'),write('?'),nl,
    % The swi-prolog reader requires the input is termianted with a '.<CR>'
    read(X),
    % Save the input into the knowledgebase so it does not need to be asked again.
    assert(known(Attr, Val, X)),
    X = yes.


% ask(Attribute, Value) :-
