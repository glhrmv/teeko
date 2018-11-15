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
	read_position_to_check(Player, Board, CNumber, LNumber),
	Columm is CNumber,
	Line is LNumber.

read_position_to(Player, Board, _, _) :-
	write('Erro na escolha do campo. Relembre:!'), nl,
	write('Columm: A to E'), nl,
	write('Line: 0 to 4'), nl,
	play_pvp(Player, Board).

read_position_to_check(_Player, Board, Columm, Line) :-
	check_free_space(Board, Columm, Line, Value),
	Value = 'e'.

read_position_to_check(Player, Board, _Columm, _Line) :-
	write('The position you choosed already has a piece!'), nl,
	play_pvp(Player, Board).




