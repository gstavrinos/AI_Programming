/* london_underground.pl */

/* question a */
line(bakerStreet,greatPortlandStreet).
line(bakerStreet,regentsPark).
line(regentsPark,oxfordCircus).
line(greatPortlandStreet,eustonSquare).
line(eustonSquare,kingsCrossStPancras).
line(kingsCrossStPancras,russelSquare).
line(russelSquare,holborn).
line(holborn,tottenhamCourtRoad).
line(tottenhamCourtRoad,goodgeStreet).
line(tottenhamCourtRoad,oxfordCircus).
line(oxfordCircus,warrenStreet).
line(warrenStreet,goodgeStreet).

/* Helper functions for both questions b and c */
edge(Station1,Station2):-line(Station1,Station2);line(Station2,Station1).
start_rev(Path,RevPath):-rev(Path,[],RevPath).
rev([H|T],Remainder,RevPath):-rev(T,[H|Remainder],RevPath).
rev([],Remainder,Remainder). 

/* question b */

goal(kingsCrossStPancras).

findroute(S):-dfs_qb([],oxfordCircus,S).

dfs_qb(Path,Curr,S):-goal(Curr),!,start_rev([kingsCrossStPancras|Path],S).
dfs_qb(Path,Curr,S):-edge(Curr,Next),not(member(Curr,Path)),dfs_qb([Curr|Path],Next,S).

/* question c */

findroute(Init,Goal,S):-dfs_qc([],Init,Goal,S).

dfs_qc(Path,Curr,Goal,S):-Curr=Goal,!,start_rev([Goal|Path],S).
dfs_qc(Path,Curr,Goal,S):-edge(Curr,Next),not(member(Curr,Path)),dfs_qc([Curr|Path], Next, Goal, S).