col(0).
col(1).
col(2).
col(3).
col(4).
line(0).
line(1).
line(2).
line(3).
line(4).

/* Bot logic */




/* Lvl2 Bot */
valid_moves(Player, Board, List) :-
	findall( (Col, Line), ( col(Col), line(Line), check_free_space(Board, Col, Line, Value), Value = 'e' ), List).
