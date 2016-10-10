/* geo.pl */
/* Sample geographical knowledge base */
/* Clause 1 */ in(atlanta,georgia).
/* Clause 2 */ in(houston,texas).
/* Clause 3 */ in(austin,texas).
/* Clause 4 */ in(toronto,ontario).
/* My Clause */in(peiraias,athens).
/* Clause 5 */ in(X,usa) :- in(X,georgia).
/* Clause 6 */ in(X,usa) :- in(X,texas).
/* Clause 7 */ in(X,canada) :- in(X,ontario).
/* Clause 8 */ in(X,north_america) :- in(X,usa).
/* Clause 9 */ in(X,north_america) :- in(X,canada).
/* My Clause */in(X,greece) :- in(X,athens).