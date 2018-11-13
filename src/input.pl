/* READ GAME MODE */

get_menu_input(Option, Min, Max) :-
	get_code(O), skip_line,
	O > 47+Min, O < 49+Max,
	Option is O.

get_menu_input(Option, Min, Max) :- get_menu_input(Option, Min, Max).

read_position_to(Player, Board, Columm, Line) :-
	write('Put Piece in Columm: '), nl,
	get_code(C), skip_line,
	C > 64, C < 70,
	write('Put Piece in line: '), nl,
	get_code(L), skip_line,	
	L > 47, L < 53,
	CNumber is C - 65,
	LNumber is L - 48,
	Columm is CNumber,
	Line is LNumber.
	