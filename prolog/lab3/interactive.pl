/*interactive.pl*/
check_for_yes :- read(R),nl,(((R == yes) -> true);((R == no) -> false);write("Wrong answer. Please try again with yes/no.\n"),check_for_yes).