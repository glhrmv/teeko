/* Rules */

check_column([Player, Player, Player, Player | _], Player).
check_column([_ | Under], Player) :-
  check_column(Under, Player).

check_rows([Player | _], [Player | _], [Player | _], [Player | _], Player).
check_rows([_ | Under1], [_ | Under2], [_ | Under3], [_ | Under4], Player) :-
  check_rows(Under1, Under2, Under3, Under4, Player).

/* A marker cannot be placed on a position wih a marker already on it */
check_free_space([L|_], Columm, 0, Value) :-
  check_free_space_c(L, Columm, Value).

check_free_space([_|Ls], Columm, Line, Value) :-
  Line > 0,
  L1 is Line - 1,
  check_free_space(Ls, Columm, L1, Value).

check_free_space_c([C | _], 0, Value) :-
  Value = C.

check_free_space_c([_|Cs], Columm, Value) :-
  Columm > 0,
  C1 is Columm - 1,
  check_free_space_c(Cs, C1, Value).

/* Check Adjacent */
check(C, L, C1, L1, _Player, _Board) :-
  check_adjacent(C, L, C1, L1).

check(_C, _L, _C1, _L1, Player, Board) :-
  write('Follow the rules!!!'), nl,
  write('YOU NEED TO BE ADJECENT!'), nl,
  play_pvp(Player, Board).

check_adjacent(C, L, C1, L1) :-
  CP is C + 1,
  CP = C1,
  L = L1.

check_adjacent(C, L, C1, L1) :-
  LP is L + 1,
  C = C1,
  LP = L1.

check_adjacent(C, L, C1, L1) :-
  CP is C - 1,
  CP = C1,
  L = L1.

check_adjacent(C, L, C1, L1) :-
  LP is L - 1,
  C = C1,
  LP = L1.

check_adjacent(C, L, C1, L1) :-
  CP is C + 1,
  LP is L + 1,
  CP = C1,
  LP = L1.

check_adjacent(C, L, C1, L1) :-
  CP is C + 1,
  LP is L - 1,
  CP = C1,
  LP = L1.

check_adjacent(C, L, C1, L1) :-
  CP is C - 1,
  LP is L + 1,
  CP = C1,
  LP = L1.

check_adjacent(C, L, C1, L1) :-
  CP is C - 1,
  LP is L - 1,
  CP = C1,
  LP = L1.

/* Check Win Line */

/* Vertical win condition */
win(Board, Player) :-
  append(_, [Column | _], Board),
  check_column(Column, Player).

/* Horizontal win condition */
win(Board, Player) :-
  append(_, [Col1, Col2, Col3, Col4 | _], Board),
  check_rows(Col1, Col2, Col3, Col4, Player).

/* Diagonal win condition type 1 (decreasing rows) */
win(Board, Player) :-
  append(_, [Col1, Col2, Col3, Col4 | _], Board),
  Col2 = [_ | NewCol2],
  Col3 = [_, _ | NewCol3],
  Col4 = [_, _, _ | NewCol4],
  check_rows(Col1, NewCol2, NewCol3, NewCol4, Player).

/* Diagonal win condition type 2 (increasing rows) */
win(Board, Player) :-
  append(_, [Col1, Col2, Col3, Col4 | _], Board),
  Col1 = [_, _, _ | NewCol1],
  Col2 = [_, _ | NewCol2],
  Col3 = [_ | NewCol3],
  check_rows(NewCol1, NewCol2, NewCol3, Col4, Player).

/* Square win condition */
win(Board, Player) :-
  append(_, [Col1, Col2| _], Board),
  Col1 = [_| Col3],
  Col2 = [_| Col4],
  check_rows(Col1, Col2, Col3, Col4, Player).

win(Board, Player) :-
  append(_, [Column | _], Board),
  check_column(Column, Player).

/* If There Is a Move that will bring 3 Connected */
/* Vertical win condition */
win_3(Board, Player) :-
  append(_, [Column | _], Board),
  check_column(Column, Player).

/* Horizontal win condition */
win_3(Board, Player) :-
  append(_, [Col1, Col2, Col3| _], Board),
  check_rows_3(Col1, Col2, Col3, Player).

/* Diagonal win condition type 1 (decreasing rows) */
win_3(Board, Player) :-
  append(_, [Col1, Col2, Col3| _], Board),
  Col2 = [_ | NewCol2],
  Col3 = [_, _ | NewCol3],
  check_rows_3(Col1, NewCol2, NewCol3, Player).

/* Diagonal win condition type 2 (increasing rows) */
win_3(Board, Player) :-
  append(_, [Col2, Col3, Col4 | _], Board),
  Col2 = [_, _ | NewCol2],
  Col3 = [_ | NewCol3],
  check_rows_3(NewCol2, NewCol3, Col4, Player).

/* Square win condition */
win_3(Board, Player) :-
  append(_, [Col1, Col2| _], Board),
  Col1 = [_| Col3],
  check_rows_3(Col1, Col2, Col3, Player).

check_column_3([Player, Player, Player| _], Player).
check_column_3([_ | Under], Player) :-
  check_column_3(Under, Player).

check_rows_3([Player | _], [Player | _], [Player | _], Player).
check_rows_3([_ | Under1], [_ | Under2], [_ | Under3], Player) :-
  check_rows_3(Under1, Under2, Under3, Player).

/* If There Is a Move that will bring 2 Connected */
/* Vertical win condition */
win_2(Board, Player) :-
  append(_, [Column | _], Board),
  check_column(Column, Player).

/* Horizontal win condition */
win_2(Board, Player) :-
  append(_, [Col1, Col2| _], Board),
  check_rows_2(Col1, Col2, Player).

/* Diagonal win condition type 1 (decreasing rows) */
win_2(Board, Player) :-
  append(_, [Col1, Col2| _], Board),
  Col2 = [_ | NewCol2],
  check_rows_2(Col1, NewCol2, Player).

/* Diagonal win condition type 2 (increasing rows) */
win_2(Board, Player) :-
  append(_, [Col3, Col4 | _], Board),
  Col3 = [_ | NewCol3],
  check_rows_2(NewCol3, Col4, Player).

check_column_2([Player, Player| _], Player).
check_column_2([_ | Under], Player) :-
  check_column_2(Under, Player).

check_rows_2([Player | _], [Player | _], Player).
check_rows_2([_ | Under1], [_ | Under2], Player) :-
  check_rows_2(Under1, Under2, Player).

