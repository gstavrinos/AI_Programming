sr([the|X],X).
sr([is|X],X).
sr([are|X],X).
sr([there|X],X).
sr([any|X],X).
sr([everything|X],[all,files|X]).
sr([every,file|X],[all,files|X]).


sr([every,A,file|X],[all,A,files|X]).
sr([i,want,you,to|X],X).
sr([i,need,you,to|X],X).
sr([what|X],X).
sr([i|X],X).
sr([want|X],X).
sr([need|X],X).
sr([see|X],X).
sr([can|X],X).
sr([could|X],X).
sr([you|X],X).
sr([yourself|X],X).
sr([program|X],X).
sr([a|X],X).
sr([an|X],X).
sr([of|X],X).
sr([in|X],X).
sr([on|X],X).
sr([to|X],X).
sr([would|X],X).
sr([like|X],X).
sr([for|X],X).
sr([me|X],X).
sr([my|X],X).
sr([between|X],X).
sr([under|X],X).
sr([show|X],X).
sr([tell|X],X).
sr([print|X],X).
sr([please|X],X).
sr([new|X],X).
sr([with|X],X).
sr([make|X],[create|X]).
sr([named|X],[name|X]).
sr([called|X],[name|X]).
sr([search|X],[find|X]).
sr([look|X],[find|X]).
sr([discover|X],[find|X]).
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
sr([power,off,the,system|_],[shutdown]).
sr([power,off,computer|_],[shutdown]).
sr([power,off,the,computer|_],[shutdown]).
sr([close,the,computer|_],[shutdown]).
sr([close,computer|_],[shutdown]).
sr([close,the,pc|_],[shutdown]).
sr([close,pc|_],[shutdown]).
sr([how,many|X],[count|X]).
sr([number|X],[count|X]).
sr([compare|X],[difference|X]).
sr([default,internet,browser|X],[firefox|X]).
sr([default,browser|X],[firefox|X]).
sr([mozilla,firefox|X],[firefox|X]).
sr([firefox,internet,browser|X],[firefox|X]).
sr([internet,browser|X],[firefox|X]).
sr([browser|X],[firefox|X]).
sr([mozilla|X],[firefox|X]).
sr([default,file,manager|X],[dolphin|X]).
sr([default,file,browser|X],[dolphin|X]).
sr([file,manager|X],[dolphin|X]).
sr([file,browser|X],[dolphin|X]).
sr([open|X],[run|X]).
sr([shortcut|X],[symlink|X]).
sr([symbolic,link|X],[symlink|X]).
sr([change,the,name|X],[rename|X]).
sr([change,name|X],[rename|X]).
sr([current,working|X],[current|X]).
sr([switch|X],[change|X]).

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

% Run Firefox
tr([run,firefox],['firefox &']).
tr([firefox],['firefox &']).

% Run Dophin File Browser
tr([run,dolphin],['dolphin &']).
tr([dolphin],['dolphin &']).

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
tr([all,X,files,Y],['ls -l ',Y,'/*.',X]).
tr([list,all,X,files,folder,Y],['ls -l ',Y,'/*.',X]).
tr([list,all,X,files,Y],['ls -l ',Y,'/*.',X]).

% Copy all files from folder to folder
tr([copy,files,from,folder,X,folder,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,files,from,X,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,all,files,from,folder,X,folder,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,all,files,from,X,Y], ['cp -r ',X,'/* ',Y]).

% Copy specific file or folder to location
tr([copy,file,X,folder,Y], ['cp ',X,' ',Y]).
tr([copy,folder,X,folder,Y], ['cp -r ',X,' ',Y]).
tr([copy,folder,X,Y], ['cp -r ',X,' ',Y]).
tr([copy,X,folder,Y], ['cp -r ',X,' ',Y]).
tr([copy,X,Y], ['cp -r ',X,' ',Y]).

% Copy type of files from folder to folder
tr([copy,X,files,from,folder,Y,folder,Z], ['cp ',Y,'/*.',X,' ',Z]).
tr([copy,X,files,from,Y,Z], ['cp ',Y,'/*.',X,' ',Z]).
tr([copy,all,X,files,from,folder,Y,folder,Z], ['cp ',Y,'/*.',X,' ',Z]).
tr([copy,all,X,files,from,Y,Z], ['cp ',Y,'/*.',X,' ',Z]).

% Move all files from folder to folder
tr([move,files,from,folder,X,folder,Y], ['mv ',X,'/* ',Y]).
tr([move,files,Y], ['mv * ',Y]).
tr([move,all,files,from,folder,X,folder,Y], ['mv ',X,'/* ',Y]).
tr([move,all,files,from,X,Y], ['mv ',X,'/* ',Y]).
tr([move,files,from,X,Y], ['mv ',X,'/* ',Y]).
tr([move,all,files,Y], ['mv * ',Y]).

% Move type of files from folder to folder
tr([move,X,files,from,folder,Y,folder,Z], ['mv ',Y,'/*.',X,' ',Z]).
tr([move,all,X,files,from,folder,Y,folder,Z], ['mv ',Y,'/*.',X,' ',Z]).
tr([move,all,X,files,folder,Z], ['mv *.',X,' ',Z]).
tr([move,all,X,files,from,Y,Z], ['mv ',Y,'/*.',X,' ',Z]).
tr([move,X,files,from,Y,Z], ['mv ',Y,'/*.',X,' ',Z]).
tr([move,all,X,files,Z], ['mv *.',X,' ',Z]).

% Move specific file or folder from folder to folder
tr([move,file,X,from,folder,Y,folder,Z], ['mv ',Y,'/',X,' ',Z]).
tr([move,folder,X,from,folder,Y,folder,Z], ['mv ',Y,'/',X,' ',Z]).
tr([move,X,from,folder,Y,folder,Z], ['mv ',Y,'/',X,' ',Z]).
tr([move,file,X,from,Y,Z], ['mv ',Y,'/',X,' ',Z]).
tr([move,folder,X,from,Y,Z], ['mv ',Y,'/',X,' ',Z]).
tr([move,X,from,Y,Z], ['mv ',Y,'/',X,' ',Z]).
tr([move,file,X,folder,Z], ['mv ',X,' ',Z]).
tr([move,folder,X,folder,Z], ['mv ',X,' ',Z]).
tr([move,file,X,Z], ['mv ',X,' ',Z]).
tr([move,folder,X,Z], ['mv ',X,' ',Z]).
tr([move,X,folder,Z], ['mv ',X,' ',Z]).
tr([move,X,Z], ['mv ',X,' ',Z]).

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

% Remove specific file or folder
tr([remove,file,X,from,Y], ['rm ',Y,'/',X]).
tr([remove,file,X,from,folder,Y], ['rm ',Y,'/',X]).
tr([remove,folder,X,from,Y], ['rm -r',Y,'/',X]).
tr([remove,folder,X,from,folder,Y], ['rm -r',Y,'/',X]).
tr([remove,X,from,folder,Y], ['rm -r ',Y,'/',X]).
tr([remove,X,from,Y], ['rm -r ',Y,'/',X]).
tr([remove,file,X], ['rm ',X]).
tr([remove,folder,X], ['rm -r ',X]).
tr([remove,X], ['rm -r ',X]).

% Differences between file X and file Y
tr([difference,files,X,and,Y], ['diff ',X,' ',Y]).
tr([difference,file,X,and,file,Y], ['diff ',X,' ',Y]).
tr([difference,file,X,and,Y], ['diff ',X,' ',Y]).
tr([difference,X,and,file,Y], ['diff ',X,' ',Y]).
tr([differences,files,X,and,Y], ['diff ',X,' ',Y]).
tr([differences,file,X,and,file,Y], ['diff ',X,' ',Y]).
tr([differences,file,X,and,Y], ['diff ',X,' ',Y]).
tr([differences,X,and,file,Y], ['diff ',X,' ',Y]).
tr([differences,X,and,Y], ['diff ',X,' ',Y]).
tr([difference,X,and,Y], ['diff ',X,' ',Y]).

% Rename file or filder from X to Y
tr([rename,from,X,Y], ['mv ',X,' ',Y]).
tr([rename,file,X,Y], ['mv ',X,' ',Y]).
tr([rename,folder,X,Y], ['mv ',X,' ',Y]).
tr([rename,X,Y], ['mv ',X,' ',Y]).

% Create new folder
tr([create,folder,X,folder,Y], ['mkdir ',Y,'/',X]).
tr([create,folder,Y,name,X], ['mkdir ',Y,'/',X]).
tr([create,folder,name,X,folder,Y], ['mkdir ',Y,'/',X]).
tr([create,folder,folder,Y,name,X], ['mkdir ',Y,'/',X]).
tr([create,Y,folder,name,X], ['mkdir ',Y,'/',X]).
tr([create,folder,name,X], ['mkdir ',X]).
tr([create,folder,X], ['mkdir ',X]).
tr([create,folder,X,Y], ['mkdir ',Y,'/',X]).

% Create new file
tr([create,file,X,folder,Y], ['touch ',Y,'/',X]).
tr([create,file,Y,name,X], ['touch ',Y,'/',X]).
tr([create,file,name,X,folder,Y], ['touch ',Y,'/',X]).
tr([create,file,folder,Y,name,X], ['touch ',Y,'/',X]).
tr([create,Y,file,name,X], ['touch ',Y,'/',X]).
tr([create,file,name,X], ['touch ',X]).
tr([create,file,name,X,Y], ['touch ',Y,'/',X]).
tr([create,file,X], ['touch ',X]).
tr([create,file,X,Y], ['touch ',Y,'/',X]).

% Create a symlink
tr([create,symlink,folder,X,name,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,folder,X,folder,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,folder,X,folder,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,folder,X,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,folder,X,folder,Y,name,Z], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,folder,X,name,Z,folder,Y], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,folder,X,name,Z,folder,Y], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,file,X,folder,Y,name,Z], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,file,X,name,Z,folder,Y], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,file,X,name,Z,folder,Y], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,file,X,name,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,file,X,folder,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,file,X,folder,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,X,folder,Y,name,Z], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,X,name,Z,folder,Y], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,X,folder,Y,name,Z], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,X,name,Z,folder,Y], ['ln -s ',X,' ',Y,'/',Z]).
tr([create,symlink,X,name,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,X,folder,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,X,folder,Y], ['ln -s ',X,' ',Y]).
tr([create,symlink,file,X,Y], ['ln -s ',X,' ',Y]).
% I am not using the last two, because the phrases
% Create a shortcut for X in Y
% and
% Create a shortcut in Y for X
% have the same result!
%tr([create,symlink,folder,X,Y], ['ln -s ',X,' ',Y]).
%tr([create,symlink,X,Y], ['ln -s ',X,' ',Y]).


% Find files with name
tr([find,all,files,name,X], ['find / -name ',X]).
tr([find,all,files,name,X,folder,Y], ['find ',Y,' -name ',X]).
tr([find,all,files,folder,Y,name,X], ['find ',Y,' -name ',X]).
tr([find,all,files,Y,name,X], ['find ',Y,' -name ',X]).
tr([find,files,name,X], ['find / -name ',X]).
tr([find,files,name,X,folder,Y], ['find ',Y,' -name ',X]).
tr([find,files,folder,Y,name,X], ['find ',Y,' -name ',X]).
tr([find,files,Y,name,X], ['find ',Y,' -name ',X]).
tr([find,file,name,X], ['find / -name ',X]).
tr([find,file,name,X,folder,Y], ['find ',Y,' -name ',X]).
tr([find,file,folder,Y,name,X], ['find ',Y,' -name ',X]).
tr([find,file,Y,name,X], ['find ',Y,' -name ',X]).
tr([find,all,files,name,X,Y], ['find ',Y,' -name ',X]).
tr([find,file,name,X,Y], ['find ',Y,' -name ',X]).
tr([find,files,name,X,Y], ['find ',Y,' -name ',X]).
tr([find,X,folder,Y], ['find ',Y,' -name ',X]).
tr([find,X], ['find / -name ',X]).

% Find all files with type
tr([find,X,files,folder,Y],['find ',Y,' -name *.',X]).
tr([find,X,files,Y],['find ',Y,' -name *.',X]).
tr([find,X,files],['find / -name *.',X]).
tr([find,all,X,files,folder,Y],['find ',Y,' -name *.',X]).
tr([find,all,X,files,Y],['find ',Y,' -name *.',X]).
tr([find,all,X,files],['find / -name *.',X]).

% Show current working directory
tr([current,folder],['pwd']).

% Change directory
tr([switch,folder,X],['cd ',X]).
tr([switch,current,folder,X],['cd ',X]).
tr([go,folder,X],['cd ',X]).
tr([go,X],['cd ',X]).

translate(Input,Result) :-
   tr(Input,Result),
   !.

translate([],[]):-
   write('Oh, come on! Say something meaningful!'),
   nl,!.

translate(_,[]) :-
   write('Sorry, but I do not quite understand...'),
   nl.


process_commands :-
  write('Hello! I am a small Prolog program created by George Stavrinos! '),
  nl,
  write('I can: '),nl,
  write('- Shutdown the computer'),nl,
  write('- Reboot the computer'),nl,
  write('- Run the Firefox internet browser'),nl,
  write('- Run the Dolphin file manager'),nl,
  write('- Show the number of files in a directory'),nl,
  write('- Show the size of a file or folder'),nl,
  write('- Show files in a directory'),nl,
  write('- Copy a file or folder in a directory'),nl,
  write('- Move a file or folder in a directory'),nl,
  write('- Remove a file or folder'),nl,
  write('- Rename a file or folder'),nl,
  write('- See the differences between two files'),nl,
  write('- Create a file or directory'),nl,
  write('- Create a shortcut for a file or folder'),nl,
  write('- Search for a file'),nl,
  write('- Show current working directory'),nl,
   repeat,
      write('What do you want me to do? - '),
      tokenize_line(user,X),
      tokens_words(X,What),
      simplify(What,SimplifiedWords),
      translate(SimplifiedWords,Command),
      pass_to_os(Command),
      Command == [exit],
   !.

pass_to_os([])     :- !.

pass_to_os([exit]) :- write('Goodbye!'),!.

pass_to_os(Command) :-
   concat(Command,String),
   write(Command),
   shell(String).


concat([H|T],Result) :-
   name(H,Hstring),
   concat(T,Tstring),
   append(Hstring,Tstring,Result).

concat([],[]).

append([H|T],L,[H|Rest]) :- append(T,L,Rest).
append([],L,L).
