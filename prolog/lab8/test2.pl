move(marylebone,baker_street).
move(baker_street, great_portland_street).
move(great_portland_street, euston_square).
move(euston_square,kings_cross).
move(kings_cross,russell_square).
move(russell_square,holborn).

connect(X,Y):-
	move(X,Y);
	move(Y,X).

find_path(Start, Goal, Solution):-
	depth_first([],Start,Goal,Solution).

depth_first(Path, Start, Goal, [Goal|Path]):-
	Start=Goal,!.
depth_first(Path, Node, Goal, Sol):-
	connect(Node,Next),
	not(member(Node,Path)),
	depth_first([Node|Path], Next, Goal, Sol).