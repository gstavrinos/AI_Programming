sr([the|X],X).
sr([is|X],X).
sr([are|X],X).
sr([there|X],X).
sr([any|X],X).
sr([disk,in,drive|X],[drive|X]).
sr([disk,in|X],[drive|X]).
sr([disk|X],[drive|X]).
sr([what,files|X],[files|X]).
sr([what|X],[files|X]).
sr([file|X],[files|X]).
sr([everything|X],[all,files|X]).
sr([every|X],[all|X]).

simplify(List,Result) :-
  sr(List,NewList),
  !,
  simplify(NewList,Result).

simplify([W|Words],[W|NewWords]) :-
  simplify(Words,NewWords).

simplify([],[]).

tr([quit],[quit]).
tr([files,on,drive,X],['cmd /k dir ',X,':']).
tr([X,files,on,drive,Y],['cmd /k dir ',Y,':*.',X]).
tr([copy,all,files,from,drive,X,to,drive,Y], ['copy ',X,':*.* ',Y,':']).
tr([files,on,directory,X],['cmd /k dir ','\\',X]).

translate(Input,Result) :-
   tr(Input,Result),
   !.

translate(_,[]) :-
   write('I do not understand'),
   nl.


process_commands :-
   repeat,
      write('Command -> '),
      tokenize_line(user,X),
      tokens_words(X,What),
      simplify(What,SimplifiedWords),
      translate(SimplifiedWords,Command),
      pass_to_os(Command),
      Command == [quit],
   !.

pass_to_os([])     :- !.

pass_to_os([quit]) :- !.

pass_to_os(Command) :-
   concat(Command,String),
   win_exec(String,show).


concat([H|T],Result) :-
   name(H,Hstring),
   concat(T,Tstring),
   append(Hstring,Tstring,Result).

concat([],[]).

append([H|T],L,[H|Rest]) :- append(T,L,Rest).
append([],L,L).
