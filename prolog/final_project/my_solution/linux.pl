sr([the|X],X).
sr([is|X],X).
sr([are|X],X).
sr([there|X],X).
sr([any|X],X).
%sr([disk,in,drive|X],[drive|X]).
%sr([what,files|X],[files|X]).
%sr([what|X],[files|X]).
%sr([file|X],[files|X]).
sr([everything|X],[all,files|X]).
sr([every|X],[all|X]).


sr([i,want,you,to|X],X).
sr([i,need,you,to|X],X).
sr([what|X],X).
sr([i|X],X).
sr([want|X],X).
sr([need|X],X).
sr([see|X],X).
sr([you|X],X).
sr([a|X],X).
sr([an|X],X).
sr([of|X],X).
sr([in|X],X).
sr([on|X],X).
sr([me|X],X).
sr([my|X],X).
sr([between|X],X).
sr([show|X],X).
sr([tell|X],X).
sr([print|X],X).
sr([please|X],X).
sr([directory|X],[folder|X]).
sr([delete|X],[remove|X]).
sr([erase|X],[remove|X]).
sr([wipe|X],[remove|X]).
sr([transfer|X],[move|X]).
sr([reboot|_],[reboot]).
sr([restart|_],[reboot]).
sr([restart,system|_],[reboot]).
sr([restart,computer|_],[reboot]).
sr([shutdown|_],[shutdown]).
sr([power,off|_],[shutdown]).
sr([power,off,system|_],[shutdown]).
sr([power,off,computer|_],[shutdown]).
sr([how,many|X],[count|X]).
sr([number|X],[count|X]).
sr([compare|X],[difference|X]).
sr([change,name|X],[rename|X]).
sr([change,the,name|X],[rename|X]).

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

% It seems that I won't need DCG!! :)

% Reboot
tr([reboot],['sudo reboot']).

% Shutdown
tr([shutdown],['sudo shutdown -h now']).

% Count all files in folder
tr([count,files,folder,X],['ls ',X,' | wc -l']).
tr([count,files,X],['ls ',X,' | wc -l']).

% Count type of files in folder
tr([count,X,files,folder,Y],['ls ',Y,'/*.',X,' | wc -l']).
tr([count,X,files,Y],['ls ',Y,'/*.',X,' | wc -l']).

% List all files in folder
tr([files,folder,X],['ls -l ',X]).
tr([files,X],['ls -l ',X]).
tr([list,files,folder,X],['ls -l ',X]).
tr([list,files,X],['ls -l ',X]).
tr([all,files,folder,X],['ls -l ',X]).
tr([all,files,X],['ls -l ',X]).
tr([list,all,files,folder,X],['ls -l ',X]).
tr([list,all,files,X],['ls -l ',X]).

% Size of folder
tr([size,folder,X],['du -cksh ',X,' | cut -f1 | tail -n1']).

% Size of file
tr([size,file,X],['du -h ',X,' | cut -f1']).

% Size of folder or file
tr([size,X],['du -cksh ',X,' | cut -f1 | tail -n1']).

% Size of file in folder
tr([size,file,X,folder,Y],['du -h ',Y,'/',X,' | cut -f1']).

% list type of files in folder
tr([X,files,folder,Y],['ls -l ',Y,'/*.',X]).
tr([list,X,files,folder,Y],['ls -l ',Y,'/*.',X]).
tr([all,X,files,folder,Y],['ls -l ',Y,'/*.',X]).
tr([list,all,X,files,folder,Y],['ls -l ',Y,'/*.',X]).
tr([list,all,X,files,Y],['ls -l ',Y,'/*.',X]).

% Copy all files from folder to folder
tr([copy,files,from,folder,X,to,folder,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,files,from,X,to,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,all,files,from,folder,X,to,folder,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,all,files,from,X,to,Y], ['cp -r ',X,'/* ',Y]).

% Copy specific file or folder to location
tr([copy,file,X,to,folder,Y], ['cp ',X,' ',Y]).
tr([copy,folder,X,to,folder,Y], ['cp -r',X,' ',Y]).
tr([copy,folder,X,to,Y], ['cp -r',X,' ',Y]).
tr([copy,X,to,folder,Y], ['cp -r ',X,' ',Y]).
tr([copy,X,to,Y], ['cp -r ',X,' ',Y]).

% Copy type of files from folder to folder
tr([copy,X,files,from,folder,Y,to,folder,Z], ['cp ',Y,'/*.',X,' ',Z]).
tr([copy,X,files,from,Y,to,Z], ['cp ',Y,'/*.',X,' ',Z]).
tr([copy,all,X,files,from,folder,Y,to,folder,Z], ['cp ',Y,'/*.',X,' ',Z]).
tr([copy,all,X,files,from,Y,to,Z], ['cp ',Y,'/*.',X,' ',Z]).

% Move all files from folder to folder
tr([move,files,from,folder,X,to,folder,Y], ['mv ',X,'/* ',Y]).
tr([move,files,from,X,to,Y], ['mv ',X,'/* ',Y]).
tr([move,all,files,from,folder,X,to,folder,Y], ['mv ',X,'/* ',Y]).
tr([move,all,files,from,X,to,Y], ['mv ',X,'/* ',Y]).

% Move type of files from folder to folder
tr([move,X,files,from,folder,Y,to,folder,Z], ['mv ',Y,'/*.',X,' ',Z]).
tr([move,X,files,from,Y,to,Z], ['mv ',Y,'/*.',X,' ',Z]).
tr([move,all,X,files,from,folder,Y,to,folder,Z], ['mv ',Y,'/*.',X,' ',Z]).
tr([move,all,X,files,from,Y,to,Z], ['mv ',Y,'/*.',X,' ',Z]).

% Remove all files from folder to folder
tr([remove,files,from,folder,X], ['rm -rf ',X,'/*']).
tr([remove,files,from,X], ['rm -rf ',X,'/*']).
tr([remove,all,files,from,folder,X], ['rm -rf ',X,'/*']).
tr([remove,all,files,from,X], ['rm -rf ',X,'/*']).

% Remove type of files from folder to folder
tr([remove,X,files,from,folder,Y], ['rm ',Y,'/*.',X]).
tr([remove,X,files,from,Y], ['rm ',Y,'/*.',X]).
tr([remove,all,X,files,from,folder,Y], ['rm ',Y,'/*.',X]).
tr([remove,all,X,files,from,Y], ['rm ',Y,'/*.',X]).

% Differences between file X and file Y
tr([differences,X,and,Y], ['diff ',X,' ',Y]).
tr([difference,X,and,Y], ['diff ',X,' ',Y]).
tr([difference,files,X,and,Y], ['diff ',X,' ',Y]).
tr([difference,file,X,and,file,Y], ['diff ',X,' ',Y]).

% Rename file or filder from X to Y
tr([rename,X,to,Y], ['mv ',X,' ',Y]).
tr([rename,from,X,to,Y], ['mv ',X,' ',Y]).
tr([rename,file,X,to,Y], ['mv ',X,' ',Y]).
tr([rename,folder,X,to,Y], ['mv ',X,' ',Y]).



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
