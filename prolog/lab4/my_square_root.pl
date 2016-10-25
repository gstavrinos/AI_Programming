/*my_square_root.pl*/
close_enough(X,X).
close_enough(X,Y) :- X<Y,Diff is Y - X,Diff<0.0001.
close_enough(X,Y) :- Y<X,close_enough(Y,X). 

approx(N,G,T) :- T is ((N / G) + G) / 2.

my_square_root(X,Y,G) :- approx(X,G,Z),not(close_enough(Z,G)) -> my_square_root(X,Y,Z);Y is G.

my_square_root(X,nonexistent) :- X<0.0.

my_square_root(X,Y) :- G is 1,my_square_root(X,Y,G).
