%
%Name: Nahome Befekadu
%Prolog Program
%

% 1. separate
% just like keep half but we separate the lists and return both
separate([],[],[]).
separate([A],[A],[]).
separate([Head,As|Tail], [Head|Rest], [As|Rests]):- separate(Tail,Rest,Rests).
 
% 2. partition  
% partitions the list into elements smaller than that pivot and bigger than the determined Z.
partition([],Z,[],[]).
partition([A|As],Z,[A|SM],BG) :- (A =< Z), partition(As,Z,SM,BG).
partition([A|As],Z,SM,[A|BG]) :- (A > Z), partition(As,Z,SM,BG).
 
% 3. quicksort
% sorts list A into an ascending list , since we have already did the partition part above where Small 
% than pivot and Bigger than pivot is figured out for us and than the Small and Big get sorted 
% recursively. the sorted list Zs is the result of appending the end of the sorted numbers larger 
%than the pivot to the appended smaller sorted list with the pivot. Base case is empty list
quicksort([],[]).
quicksort([A|As], Zs) :- partition(As,A,Small,Big),
    quicksort(Small, SSmall),quicksort(Big, SBig), append(SSmall, [A], Ys).
    append(Ys,SBig,Zs).

% 4. mini
% first we get the minimum then we figure if A is less than Z than we use A but if A is greater than 
% Z we would use Z 
mini([Min],Min).           
mini([A,Z|Tail],M) :- A =< Z, mini([A|Tail],M).             
mini([A,Z|Tail],M) :- A > Z, mini([Z|Tail],M).               

% 5. reverse
% base case is empty list, a list of length greater than or equal to one is reversed by first reversing 
% its tail and then you want to append the head to the reversed tail all shown in the last two lines 
% with append/3
app([],[],[]).
app([], [Head|Tail], [Head|Tail]).
app([Head|Tail], L, [Head|R]) :- app(Tail,L,R).
rev([],[]).
rev([Head|Tail], R) :- rev(Tail, Rev), app(Rev, [Head], R).

% 6.  Eliminating repetitive inefficiency
rev2(X,Y) :- rev2recursive(X, [], Y).
rev2recursive([], Solution, Solution).
rev2recursive([H,T], Partial, Z) :- rev2recursive(T, [H|Partial], Z).

% 7.Insertion sort
% the insert helper method it helps with first getting the head and then sort the tail out 
% depending on whether A < Head or A > Head . Then we check if the list isnt empty and if its not 
% than it inserts the Head using the insert method into whatever the appropriate place of tail is.
insert(A, [], [A]).
insert(A, [Head|Tail], [A|L]):- A =< Head, insert(Head, Tail, L).
insert(A, [Head|Tail], [Head|L]):- A > Head, insert(A, Tail, L).
insertionSort([], []).
insertionSort([Head|Tail], R):- insertionSort(Tail, W), insert(Head, W, R).
