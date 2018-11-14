/* Utilities */

player(1, Value) :- Value = b.
player(2, Value) :- Value = w.

/* Count number of piece Piece in a board */
count_pieces([], _Piece, 0).
count_pieces([Line | Lines], Piece, Count) :-
  count_elem(Line, Piece, NCount),
  count_pieces(Lines, Piece, NNCount),
  Count is (NCount + NNCount).

count_elem([], _X, 0).
count_elem([X|T],X,Y) :- count_elem(T,X,Z), Y is 1+Z.
count_elem([X1|T],X,Z) :- X1\=X,count_elem(T,X,Z).

/* To put a piece in the board */
put_piece(B, X, Y, Letter, R) :-
	find_line(B, X, Y, Letter, R).

find_line( [L|Ls] , 0 , Y , Z , [R|Ls] ) :-
	find_column(L,Y,Z,R).

find_line( [L|Ls] , X , Y , Z , [L|Rs] ) :-
	X > 0 ,
	X1 is X-1 ,
	find_line( Ls , X1 , Y , Z , Rs ).

find_column( [_|Cs] , 0 , Z , [Z|Cs] ).
find_column( [C|Cs] , Y , Z , [C|Rs] ) :-
	Y > 0 ,
	Y1 is Y-1 ,
	find_column( Cs , Y1 , Z , Rs ).

