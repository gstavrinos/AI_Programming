/*display_degrees.pl*/


list_length([],0).
list_length([_|Tail],K) :- list_length(Tail,J),K is J + 1.

final_print([X|_]) :- write(X),nl.

isolate_degrees([],0) :- true.
isolate_degrees([X|Rest],Length) :- final_print(X),L is Length - 1,isolate_degrees(Rest,L).
isolate_degrees([X|_]) :- list_length(X,K),isolate_degrees(X,K).

display_degrees([Name|Rest]) :- list_length(Rest,K),K>=3 -> write(Name),write(' has the following degrees: '),nl,isolate_degrees(Rest);write(Name),write(' has no college degree.').
