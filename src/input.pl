/* Input */

read_position_to(Player, Board, Columm, Line) :-
	write('Put marker in Columm: '), nl,
	get_code(C), skip_line,
	C > 64, C < 70,
	write('Put marker in line: '), nl,
	get_code(L), skip_line,
	L > 47, L < 53,
	CNumber is C - 65,
	LNumber is L - 48,
	read_position_to_check(Player, Board, CNumber, LNumber),
	Columm is CNumber,
	Line is LNumber.

read_position_to(Player, Board, _, _) :-
	write('Invalid position choice. Remember:'), nl,
	write('Columm: A to E'), nl,
	write('Line: 0 to 4'), nl,
	play_pvp(Player, Board).

read_position_from(Player, Board, Columm, Line) :-
	write('Get the Piece in Column: '), nl,
	get_code(C), skip_line,
	C > 64, C < 70,
	write('Get the Piece in Line: '), nl,
	get_code(L), skip_line,
	L > 47, L < 53,
	CNumber is C - 65,
	LNumber is L - 48,
	read_position_to_check_from(Player, Board, CNumber, LNumber),
	Columm is CNumber,
	Line is LNumber.

read_position_from(Player, Board, _, _) :-
	write('Erro na escolha do campo. Relembre:!'), nl,
	write('Columm: A to E'), nl,
	write('Line: 0 to 4'), nl,
	play_pvp(Player, Board).

read_position_to_check(_Player, Board, Columm, Line) :-
	check_free_space(Board, Columm, Line, Value),
	Value = 'e'.

read_position_to_check(Player, Board, _Columm, _Line) :-
	write('There is already a marker on that position'), nl,
	play_pvp(Player, Board).

read_position_to_check_from(Player, Board, Columm, Line) :-
	check_free_space(Board, Columm, Line, Value),
	player(Player, Piece),
	Value = Piece.

read_position_to_check_from(Player, Board, _Columm, _Line) :-
	write('That is not your marker!!'), nl,
	play_pvp(Player, Board).
