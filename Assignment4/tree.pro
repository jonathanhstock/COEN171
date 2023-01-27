insert(X,empty,node(empty,X,empty)).
insert(X,node(Left,Y,Right),node(Ls,Y,Right)) :- X < Y, !, insert(X,Left,Ls).
insert(X,node(Left,Y,Right),node(Left,Y,Rs)) :- insert(X,Right,Rs).

exists(X,node(_,X,_)).
exists(X,node(Left,Y,_)) :- X < Y, !, exists(X,Left).
exists(X,node(_,Y,Right)) :- exists(X,Right).
