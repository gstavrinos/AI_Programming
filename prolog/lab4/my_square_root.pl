/*my_square_root.pl*/
/*Write a predicate my_square_root(X,Y) */
/* that unifies Y with the square root of X. */
/*Find the square root by successive approximations, */
/*based on the principle that if G is a reasonable good */
/*guess for the square root of N, then (N/G + G)/2 is a */
/*better guess. Start with G = 1, and stop when G no longer*/ 
/*changes very much from one iteration to the next. */


close_enough(X,X).
close_enough(X,Y) :- X<Y,Diff is Y - X,Diff<0.0001.
close_enough(X,Y) :- Y<X,close_enough(Y,X). 

rec(N,G,T) :- write('skata'),write(N),nl,write(G),nl,write(T),nl,T is ((N / G) + G) / 2.

my_square_root(X,Y,G) :- write(G),nl,rec(X,G,Y),write(Y),nl,not(close_enough(Y,G)) -> my_square_root(X,Y,Y);Y is G.

my_square_root(X,Y) :- G is 1,my_square_root(X,Y,G).