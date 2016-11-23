move(marylebone,baker_street).
move(baker_street, great_portland_street).
move(great_portland_street, euston_square).
move(euston_square,kings_cross).
move(kings_cross,russell_square).
move(russell_square,holborn).

goal(kings_cross).

connect(X,Y):-
	move(X,Y);
	move(Y,X).

depth_first([],Solution):-write(Solution).

depth_first(Path, Start, [Start|Path]):-goal(Start),!.
depth_first(Path, Node, Sol):-
	connect(Node,Next),
	not(member(Node,Path)),
	depth_first([Node|Path], Next, Sol).