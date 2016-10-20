/*learn_capitals2.pl*/
save_capital(State, Capital) :- assertz(capital(Capital, State)).
learn_capitals(stop) :- true.
learn_capitals(State) :- write('Capital? '),read(Capital),save_capital(State,Capital),learn_capitals.
learn_capitals :- write('State? '),read(State),learn_capitals(State).

type_capitals :- capital(C,S),write("State: "),write(S),write(", Capital: "),write(C),retract(capital(C,S)),nl,fail.