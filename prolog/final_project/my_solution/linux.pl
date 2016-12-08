sr([the|X],X).
sr([is|X],X).
sr([are|X],X).
sr([there|X],X).
sr([any|X],X).
sr([in|X],[on|X]).
%sr([disk,in,drive|X],[drive|X]).
sr([folder,in|X],[folder|X]).
sr([what,files|X],[files|X]).
sr([what|X],[files|X]).
sr([file|X],[files|X]).
sr([show|X],[list|X]).
sr([print|X],[list|X]).
sr([everything|X],[all,files|X]).
sr([every|X],[all|X]).
sr([directory|X],[folder|X]).

simplify(List,Result) :-
  sr(List,NewList),
  !,
  simplify(NewList,Result).

simplify([W|Words],[W|NewWords]) :-
  simplify(Words,NewWords).

simplify([],[]).

tr([quit],[exit]).
tr([exit],[exit]).
tr([close],[exit]).
tr([leave],[exit]).


tr([files,on,folder,X],['ls -la ',X]).
tr([list,files,on,folder,X],['ls -la ',X]).

tr([all,files,on,folder,X],['ls -la ',X]).
tr([list,all,files,on,folder,X],['ls -la ',X]).

tr([X,files,on,folder,Y],['ls -la ',Y,'/*.',X]).
tr([list,X,files,on,folder,Y],['ls -la ',Y,'/*.',X]).

tr([X,files,on,folder,Y],['ls -la ',Y,'/*.',X]).
tr([list,X,files,on,folder,Y],['ls -la ',Y,'/*.',X]).
tr([all,X,files,on,folder,Y],['ls -la ',Y,'/*.',X]).
tr([list,all,X,files,on,folder,Y],['ls -la ',Y,'/*.',X]).

tr([copy,all,files,from,folder,X,to,folder,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,X,files,from,folder,Y,to,folder,Z], ['cp ',Y,'/*.',X,' ',Z]).
%tr([files,on,directory,X],['cmd /k dir ','\\',X]).

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
      Command == [exit],
   !.

pass_to_os([])     :- !.

pass_to_os([exit]) :- !.

pass_to_os(Command) :-
   concat(Command,String),
   shell(String).


concat([H|T],Result) :-
   name(H,Hstring),
   concat(T,Tstring),
   append(Hstring,Tstring,Result).

concat([],[]).

append([H|T],L,[H|Rest]) :- append(T,L,Rest).
append([],L,L).
