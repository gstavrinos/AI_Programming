/*absval.pl*/
absval(X,Y) :- X<0,Y is -X,!.
absval(X,Y) :- X>=0,Y is X,!.