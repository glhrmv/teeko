/* RULES */

/* Same piece cannot be placed at already existent piece */

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

/* Check Win Line */

% Vertical win condition
win(Board, Player) :-
  append(_, [Column | _], Board),
  check_column(Column, Player).

% Horizontal win condition
win(Board, Player) :-
  append(_, [Col1, Col2, Col3, Col4 | _], Board),
  check_rows(Col1, Col2, Col3, Col4, Player).

% Diagonal win condition type 1 (decreasing rows)
win(Board, Player) :-
  append(_, [Col1, Col2, Col3, Col4 | _], Board),
  Col2 = [_ | NewCol2],
  Col3 = [_, _ | NewCol3],
  Col4 = [_, _, _ | NewCol4],
  check_rows(Col1, NewCol2, NewCol3, NewCol4, Player).

% Diagonal win condition type 2 (increasing rows)
win(Board, Player) :-
  append(_, [Col1, Col2, Col3, Col4 | _], Board),
  Col1 = [_, _, _ | NewCol1],
  Col2 = [_, _ | NewCol2],
  Col3 = [_ | NewCol3],
  check_rows(NewCol1, NewCol2, NewCol3, Col4, Player).

% Square win condition
win(Board, Player) :-
  append(_, [Col1, Col2| _], Board),
  Col1 = [_| Col3],
  Col2 = [_| Col4],
  check_rows(Col1, Col2, Col3, Col4, Player).

check_column([Player, Player, Player, Player | _], Player).
check_column([_ | Under], Player) :-
  check_column(Under, Player).

check_rows([Player | _], [Player | _], [Player | _], [Player | _], Player).
check_rows([_ | Under1], [_ | Under2], [_ | Under3], [_ | Under4], Player) :-
  check_rows(Under1, Under2, Under3, Under4, Player).

