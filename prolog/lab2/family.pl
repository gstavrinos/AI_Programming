father(david,carla).       
father(david,tim). 
father(jose_david,david).  
father(jose_david,eullen).
father(jose,jose_david).
father(roland,catherine).  
father(roland,michael).
father(simon,roland).
mother(catherine,carla).   
mother(catherine,tim).
mother(denise,catherine).  
mother(denise,michael).
mother(cecile,roland).
mother(guillermina,david). 
mother(guillermina,eullen).
mother(digna,guillermina).
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
/* I am not using more rules and facts than the ones specified */
/* Gender and siblings would make this MUCH easier! */
aunt(X,Y) :- father(Z,Y),father(K,Z),father(K,X),mother(X,_),not(mother(X,Y)).
aunt(X,Y) :- mother(Z,Y),father(K,Z),father(K,X),mother(X,_),not(mother(X,Y)).
aunt(X,Y) :- mother(Z,Y),mother(K,Z),mother(K,X),mother(X,_),not(mother(X,Y)).
aunt(X,Y) :- father(Z,Y),mother(K,Z),mother(K,X),mother(X,_),not(mother(X,Y)).
uncle(X,Y) :- father(Z,Y),father(K,Z),father(K,X),father(X,_),not(father(X,Y)).
uncle(X,Y) :- mother(Z,Y),father(K,Z),father(K,X),father(X,_),not(father(X,Y)).
uncle(X,Y) :- mother(Z,Y),mother(K,Z),mother(K,X),father(X,_),not(father(X,Y)).
uncle(X,Y) :- father(Z,Y),mother(K,Z),mother(K,X),father(X,_),not(father(X,Y)).
cousin(X,Y) :- aunt(Z,Y),mother(Z,X).
cousin(X,Y) :- uncle(Z,Y),father(Z,X).
stepfather(X,Y) :- married(X,Z),not(mother(Z,Y)).
stepmother(X,Y) :- married(X,Z),not(father(Z,Y)).