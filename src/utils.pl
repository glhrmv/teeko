/* Utilities */

player(1, Value) :- Value = b.
player(2, Value) :- Value = w.

/* Count number of marker Piece in a board */
count_markers([], _Piece, 0).
count_markers([Line | Lines], Piece, Count) :-
  count_elem(Line, Piece, NCount),
  count_markers(Lines, Piece, NNCount),
  Count is (NCount + NNCount).

count_elem([], _X, 0).
count_elem([X|T],X,Y) :- count_elem(T,X,Z), Y is 1+Z.
count_elem([X1|T],X,Z) :- X1\=X,count_elem(T,X,Z).

/* To put a marker in the board */
move(B, X, Y, Letter, R) :-
  find_line(B, X, Y, Letter, R).

find_line([L|Ls], 0, Y, Z, [R|Ls]) :-
  find_column(L,Y,Z,R).

find_line([L|Ls], X, Y, Z, [L|Rs]) :-
  X > 0 ,
  X1 is X-1 ,
  find_line( Ls , X1 , Y , Z , Rs ).

find_column([_|Cs], 0, Z, [Z|Cs]).
find_column([C|Cs], Y, Z, [C|Rs]) :-
  Y > 0 ,
  Y1 is Y-1 ,
  find_column( Cs , Y1 , Z , Rs ).

/* Count number of times a Predicate is true */
count_true(Pred, Count) :-
  findall(_, Pred, L),
  length(L, Count).

/* Unicode characteres */

lt_corner :- put_code(9484).
rt_corner :- put_code(9488).
lb_corner :- put_code(9492).
rb_corner :- put_code(9496).
horiz :- put_code(9472).
vert :- put_code(9474).
top_con :- put_code(9516).
bottom_con :- put_code(9524).
left_con :- put_code(9500).
right_con :- put_code(9508).
middle :- put_code(9532).

double_lt_corner :- put_code(9556).
double_rt_corner :- put_code(9559).
double_lb_corner :- put_code(9562).
double_rb_corner :- put_code(9565).
double_vert :- put_code(9553).
double_horiz :- put_code(9552).
double_left_con :- put_code(9568).
double_right_con :- put_code(9571).

black_circle :- put_code(11044).
white_circle :- put_code(11093).

double_horiz(0).
double_horiz(N) :- double_horiz, N1 is N-1, double_horiz(N1).

space(0).
space(N) :- write(' '), N1 is N-1, space(N1).
