/* geo.pl */
/* Sample geographical knowledge base */
/* Clause 1 */ in('Atlanta','Georgia').
/* Clause 2 */ in('Houston','Texas').
/* Clause 3 */ in('Austin','Texas').
/* Clause 4 */ in('Toronto','Ontario').
/* My Clause */in('Peiraias','Athens').
/* Clause 5 */ in(X,'USA') :- in(X,'Georgia').
/* Clause 6 */ in(X,'USA') :- in(X,'Texas').
/* Clause 7 */ in(X,'Canada') :- in(X,'Ontario').
/* Clause 8 */ in(X,'North_America') :- in(X,'USA').
/* Clause 9 */ in(X,'North_America') :- in(X,'Canada').
/* My Clause */in(X,'Greece') :- in(X,'Athens').