
%HIBA KHODJI
/*

somme([],0).
somme(L,S):- L=[X|Y], somme(Y,M),S is M+X.

moyenne([],0).
moyenne(L,M):-somme(L,S),list_length(L,N), M is S/N.




factorial(0,1).
factorial(N,F):-
N>0,
N1 is N-1,
factorial(N1,F1),
F is N*F1.



membre(E,L):- L=[X|Y], E=X.
membre(E,L):- L=[X|Y], membre(E,Y).

fib(0, 0).
fib(1, 1).
fib(N, Result) :- N>1,
A is N-1, B is N-2, fib(A, Result1), fib(B, Result2), Result is Result1 + Result2.


membreListe([],L).
membreListe([H|T],L):- membre(H,L), membreListe(T,L).


replace(E1,E2,[],[]).
replace(E1,E2,[E1|T1],[E2|T2]):-replace(E1,E2,T1,T2).
replace(E1,E2,[H|T1],[H|T2]):-E1\=H, replace(E1,E2,T1,T2).

replace(E,S,[],[]).
replace(E,S,[E|T1],[S|T2]):-replace(E,S,T1,T2).
replace(E,S,[H|T1],[H|T2]):-E\=H, replace(E,S,T1,T2).





age(peter,4).
age(peter,6).
age(peter,4).
age(ahmed,5).
age(amira,6).
age(badr,6).
age(samira,6).


bagof(Child,age(Child,Age),Results).
Age = 4,
Results = [peter, peter] ;
Age = 5,
Results = [ahmed] ;
Age = 6,
Results = [peter, amira, badr, samira].

setof(Child,age(Child,Age),Results).
Age = 4,
Results = [peter] ;
Age = 5,
Results = [ahmed] ;
Age = 6,
Results = [amira, badr, peter, samira].

findall(Child,age(Child,Age),Results).
Results = [peter, peter, peter, ahmed, amira, badr, samira].

functor(t(f(X), X, t), F, D).
F = t,
D = 3.

arg(3,t(a,b,c),Y).
Y = c.

arg(X,t(a,b,c),Y).
X = 1,
Y = a ;
X = 2,
Y = b ;
X = 3,
Y = c.


different(U,U):-!,fail.
different(_,_).


count([],X,0).
count([X|T],X,Y):- count(T,X,Z), Y is 1+Z.
count([X1|T],X,Z):- X1\=X,count(T,X,Z).


concat([],L,L).
concat([X|L1],L2,[X|L3]) :- concat(L1,L2,L3).

palindrome(L):- inverse(L,L).

rang_pair([],[]).
rang_pair([_],[]).
rang_pair([_,Y|L],[Y|L2]) :- rang_pair(L,L2).



replace(_,_,[],[]).
replace(X,Y,[X|L1],[Y|L2]):-replace(X,Y,L1,L2).
replace(X,Y,[Z|L1],[Z|L2]):-replace(X,Y,L1,L2).

somme(L,R) :- sommebis(L,1,R).
sommebis([],_,0).
sommebis([X|L],I,S2) :- J is I+1, sommebis(L,J,S1), S2 is X*I+S1.




append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3).



sommeListe([],[]).
sommeListe([X],[X]).
sommeListe([H|T],[K|R]):- inverse(T,I), I=[B|C], K is H+B, sommeListe(C,R).


dernier(X,[X]).
dernier(X,[_|Y]):- dernier(X,Y).

add(X,L,[X|L]).



*/

member(X,[X|_]).
member(X,[L|_]):-member(X,L).
member(X,[_|T]):-member(X,T).


nbOcc(_,[],0).
nbOcc(E,[E|R],N):-!,nbOcc(E,R,M),N is M+1.
nbOcc(E,[_|L],N):-nbOcc(E,L,N).


nbOccNested(_,[],0).
nbOccNested(E,[X|R],N):-atomic(X),E==X,nbOccNested(E,R,M),N is M+1.
nbOccNested(E,[X|R],N):-atomic(X),E=\=X,nbOccNested(E,R,N).
nbOccNested(E,[X|R],N):- \+ atomic(X),nbOccNested(E,X,I), nbOccNested(E,R,U), N is I+U.



compteElems([],0).
compteElems([X|Y],N):- atomic(X),compteElems(Y,M), N is M+1.
compteElems([X|Y],N):- \+ atomic(X), compteElems(X,I), compteElems(Y,J), N is I+J.



subst(_,_,[],[]).
subst(X,Y,[Z|L1],[Y|L2]) :-Z==X,subst(X,Y,L1,L2).
subst(X,Y,[Z|L1],[Z|L2]) :-Z\==X, subst(X,Y,L1,L2).

fusionner([],[],[]).
fusionner([],[X],[X]).
fusionner([X],[],[X]).
fusionner([H1 |T1], [H2 | T2], [H1, H2 | F]) :-fusionner(T1, T2, F).


max([X],X).
max([X|L],M):- max(L,M), M>=X.
max([X|L],X):- max(L,M), M=<X.


min([X],X).
min([X,Y|L],M):- X<Y, min([X|L],M).
min([X,Y|L],M):- X>=Y, min([Y|L],M).

minmax([X],X,X).
minmax(L,MIN,MAX):-min(L,M), max(L,X), MIN is M, MAX is X.


list_length([],0).
list_length([_|T],N):-list_length(T,M), N is M+1.


minimum(X,Y,Z):- (X<Y, Z is X); (X>Y, Z is Y).

inverse([],[]).
inverse([H|T],I) :- inverse(T,Y), append(Y,[H],I).

checkDouble([],[]).
checkDouble(L,[C|J]):- inverse(L,I), I=[A|B],inverse(B,K), checkDouble(K,J), C is A*A.



pluscourte([X],X).
pluscourte([X,Y|L],P):-list_length(X,L1), list_length(Y,L2), L1<L2, pluscourte([X|L],P).
pluscourte([X,Y|L],P):-list_length(X,L1), list_length(Y,L2), L1>L2, pluscourte([Y|L],P).



sum([],0).
sum([X|T],N):-sum(T,M), N is X+M.



exist(X,[X]).
exist(X,[_|T]):-exist(X,T).


elimineToutOcc(_,[],[]).
elimineToutOcc(X,[Z|Y],L):-(X==Z, elimineToutOcc(X,Y,L));(X\==Z, L=[Z|E], elimineToutOcc(X,Y,E)).

nbOcc2(_,[],0).
nbOcc2(X,[Z|Y],N):-(X==Z, nbOcc2(X,Y,M), N is M+1); (X\==Z, nbOcc2(X,Y,N)).


remplace(_,_,[],[]).
remplace(X,Y,[Z|L1],[Y|L2]) :-Z==X, remplace(X,Y,L1,L2).
remplace(X,Y,[Z|L1],[Z|L2]) :-Z\==X, remplace(X,Y,L1,L2).

long([],0).
long([X|Y],N):-atomic(X), long(Y,L), N is L+1.
long([X|Y],N):-is_list(X), long(X,M), long(Y,L), N is M+L.




remplaceminmax([],[]).
remplaceminmax(L1,L2):- min(L1,M), max(L1,K), remplace(M,K,L1,L2).

effDroite(_,[],[]).
effDroite(E,[Z|T],L):- (E\==Z, L=[Z|R], effDroite(E,T,R));(E==Z, L=[E]).

decompose([]).
decompose([X|Y]):-write(X),nl, decompose(Y).


inserer(X,[],[X]).
inserer(X,L,[X|L]).

extrait(X,[X],[Y|_],Y).
extrait(X,[X|_],[Y|_],Y).
extrait(X,[_|T],[_|U],Y):-extrait(X,T,U,Y).



insererPos(X,0,L,[X|L]).
insererPos(X,P,[Y|T],R):- R=[Y|E], S is P-1, insererPos(X,S,T,E).

switch(_,_,[],[]).
switch(X,E,[Z|T],R):- (X\==Z, R=[Z|I], switch(X,E,T,I));(X==Z, R=[E|T]).



replaceAt(0,E,L,R):- L=[X|_], switch(X,E,L,R).
replaceAt(P,E,[X|T],R):-  R=[X|G], S is P-1,replaceAt(S,E,T,G).



