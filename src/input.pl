/* READ GAME MODE */

get_menu_input(Option, Min, Max) :-
	get_code(O), skip_line,
	O > 47+Min, O < 49+Max,
	Option is O.

get_menu_input(Option, Min, Max) :- get_menu_input(Option, Min, Max).

read_position_from(Player, Board, Columm, Line) :-
	write('From: '),
	get_code(C),
	get_code(L), skip_line,
	C > 47, C < 53, % 0 to 4
	L > 64, L < 70, % A to E
	put_piece(Columm, Line,Player, Board).