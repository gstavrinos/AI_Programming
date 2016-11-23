move(baker_street,great_portland_street).
move(baker_street,regents_park).
move(regents_park,oxford_circus).
move(great_portland_street,euston_square).
move(euston_square,kings_cross_st_pancras).
move(kings_cross_st_pancras,russel_square).
move(russel_square,holborn).
move(holborn,tottenham_court_road).
move(tottenham_court_road,goodge_street).
move(tottenham_court_road,oxford_circus).
move(oxford_circus,warren_street).
move(warren_street,goodge_street).

connect(X,Y):-
	move(X,Y);
	move(Y,X).

find_path(Start, Goal, Solution):-
	dfs([],Start,Goal,Solution).

dfs(Path, Start, Goal, [Goal|Path]):-
	Start=Goal,!.
dfs(Path, Node, Goal, Sol):-
	connect(Node,Next),
	not(member(Node,Path)),
	dfs([Node|Path], Next, Goal, Sol).