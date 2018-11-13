/* Utilities */

player(1, Value) :- Value = b.
player(2, Value) :- Value = w.

/* Count number of piece Piece in a board */
count_pieces([], Piece, 0).
count_pieces([Line | Lines], Piece, Count) :-
  count_elem(Line, Piece, NCount),
  count_pieces(Lines, Piece, NNCount),
  Count is (NCount + NNCount).

count_elem([], X, 0).
count_elem([X|T],X,Y) :- count_elem(T,X,Z), Y is 1+Z.
count_elem([X1|T],X,Z) :- X1\=X,count_elem(T,X,Z).

