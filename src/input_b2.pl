/* Input */

read_position_to_b2(Player, Board, Columm, Line) :-
	write('Put marker in Columm: '), nl,
	get_code(C), skip_line,
	C > 64, C < 70,
	write('Put marker in line: '), nl,
	get_code(L), skip_line,
	L > 47, L < 53,
	CNumber is C - 65,
	LNumber is L - 48,
	read_position_to_check_b2(Player, Board, CNumber, LNumber),
	Columm is CNumber,
	Line is LNumber.

read_position_to_b2(Player, Board, _, _) :-
	write('Invalid position choice. Remember: '), nl,
	write('Columm: A to E'), nl,
	write('Line: 0 to 4'), nl,
	bot_2(Player, Board).
	
read_position_from_b2(Player, Board, Columm, Line) :-
	write('Get the Piece in Column: '), nl,
	get_code(C), skip_line,
	C > 64, C < 70,
	write('Get the Piece in Line: '), nl,
	get_code(L), skip_line,	
	L > 47, L < 53,
	CNumber is C - 65,
	LNumber is L - 48,
	read_position_to_check_from_b2(Player, Board, CNumber, LNumber),
	Columm is CNumber,
	Line is LNumber.
	
read_position_from_b2(Player, Board, _, _) :-
	write('Erro na escolha do campo. Relembre:!'), nl,
	write('Columm: A to E'), nl,
	write('Line: 0 to 4'), nl,
	bot_2(Player, Board).

read_position_to_check_b2(_Player, Board, Columm, Line) :-
	check_free_space(Board, Columm, Line, Value),
	Value = 'e'.

read_position_to_check_b2(Player, Board, _Columm, _Line) :-
	write('There is already a marker on that position'), nl,
	bot_2(Player, Board).

read_position_to_check_from_b2(Player, Board, Columm, Line) :-
	check_free_space(Board, Columm, Line, Value),
	player(Player, Piece),
	Value = Piece.

read_position_to_check_from_b2(Player, Board, _Columm, _Line) :-
	write('That is not your marker!!'), nl,
	bot_2(Player, Board).