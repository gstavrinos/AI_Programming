/*my_close_enough.pl*/
my_close_enough(X,Y) :- (X > Y) -> (Xf is X * 1.0,Div is Y / Xf,Diff is 1 - Div,Diff =< 0.1);((Y > X) -> (Yf is Y * 1.0,Div is X / Yf,Diff is 1 - Div,Diff =< 0.1));true.