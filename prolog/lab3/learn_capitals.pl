/*learn_capitals.pl*/
learn_capitals :- write("State? "),
					read(R1),(
							(R1 \= stop) -> (
								write("Capital? "),
								read(R2),
								(R2 \= stop) -> assertz(capital(R2,R1)),learn_capitals
							)
						).


type_capitals :- capital(C,S),write("State: "),write(S),write(", Capital: "),write(C),retract(capital(C,S)),nl,fail.