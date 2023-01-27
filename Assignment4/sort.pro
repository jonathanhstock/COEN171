partition(_,[],[],[]).
partition(P,[X|Xs],[X|Ys],Zs) :- X < P, partition(P,Xs,Ys,Zs).
partition(P,[X|Xs],Ys,[X|Zs]) :- X >= P, partition(P,Xs,Ys,Zs).

quicksort([],[]).
quicksort([H|X],Y) :- partition(H,X,L1,L2), quicksort(L1,S1), quicksort(L2,S2), append(S1,[H|S2],Y).
