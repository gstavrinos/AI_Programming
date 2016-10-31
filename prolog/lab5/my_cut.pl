/*my_cut.pl*/
 
fact(1). 
fact(2). 

my_cut :- !.

cuttest0(X) :- fact(X), !. 
cuttest1(X) :- fact(X), my_cut. 