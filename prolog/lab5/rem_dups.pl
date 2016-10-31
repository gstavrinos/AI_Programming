/*rem_dups.pl*/

rem_dups([First|Tail],X,L) :- not(member(First,L)),!,append(L,[First],K),rem_dups(Tail,X,K).
rem_dups([First|Tail],X,L) :- member(First,L),!,rem_dups(Tail,X,L).
rem_dups([],X,L) :- X=L.

rem_dups([First|Tail],X) :- var(X),!,L=[First],rem_dups(Tail,X,L).