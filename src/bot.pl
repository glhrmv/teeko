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

/* Bot lvl1 logic */

bot_1(2, Board) :-
	Other is ((2 mod 2) + 1),
	player(Other, Value),
	win(Board, Value),
	write(Other),
	write('You won!'), nl,
	halt.
	
bot_1(1, Board) :-
	Other is ((1 mod 2) + 1),
	player(Other, Value),
	win(Board, Value),
	write(Other),
	write('Bot won!'), nl,
	halt.
		
/*Player to play*/

bot_1(1, Board) :- 
	write('To play: Player'), write(1), nl,
	player(1, Value),
	count_markers(Board, Value, Count),
	Count < 4,
	read_position_to_b(1, Board, C, L),
	player(1, Letter),
	put_marker(Board, L, C, Letter, NewBoard),
	print_board(NewBoard),
	Other is ((1 mod 2) + 1),
	bot_1(Other, NewBoard).
	
bot_1(1, Board) :-
	player(1, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	read_position_from_b(1, Board, C, L),
	read_position_to_b(1, Board, C1, L1),
	check(C, L, C1, L1, 1, Board),
	put_marker(Board, L, C, e, NewBoard),
	put_marker(NewBoard, L1, C1, Letter, MoreNewBoard),
	print_board(MoreNewBoard),
	Other is ((1 mod 2) + 1),
	bot_1(Other, MoreNewBoard).

/*Bot to Play*/	
bot_1(2, Board) :-
	write('Bot to play: Player'), write(2), nl,
	player(2, Value),
	count_markers(Board, Value, Count),
	Count < 4,
	valid_moves(2, Board, List),
	choose(List, [C,L|_]),
	player(2, Letter),
	put_marker(Board, L, C, Letter, NewBoard),
	print_board(NewBoard),
	Other is ((2 mod 2) + 1),
	bot_1(Other, NewBoard).
	
bot_1(2, Board) :-
	player(2, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	valid_moves(2, Board, List),
	choose(List, [C, L, C1, L1|_]),
	check(C, L, C1, L1, 2, Board),
	put_marker(Board, L, C, e, NewBoard),
	put_marker(NewBoard, L1, C1, Letter, MoreNewBoard),
	print_board(MoreNewBoard),
	Other is ((2 mod 2) + 1),
	bot_1(Other, MoreNewBoard).

/* Bot lvl2 logic */

bot_2(2, Board) :-
	Other is ((2 mod 2) + 1),
	player(Other, Value),
	win(Board, Value),
	write(Other),
	write('You won!'), nl,
	halt.
	
bot_2(1, Board) :-
	Other is ((1 mod 2) + 1),
	player(Other, Value),
	win(Board, Value),
	write(Other),
	write('Bot won!'), nl,
	halt.
		
/*Player to play*/

bot_2(1, Board) :- 
	write('To play: Player'), write(1), nl,
	player(1, Value),
	count_markers(Board, Value, Count),
	Count < 4,
	read_position_to_b(1, Board, C, L),
	player(1, Letter),
	put_marker(Board, L, C, Letter, NewBoard),
	print_board(NewBoard),
	Other is ((1 mod 2) + 1),
	bot_1(Other, NewBoard).
	
bot_2(1, Board) :-
	player(1, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	read_position_from_b(1, Board, C, L),
	read_position_to_b(1, Board, C1, L1),
	check(C, L, C1, L1, 1, Board),
	put_marker(Board, L, C, e, NewBoard),
	put_marker(NewBoard, L1, C1, Letter, MoreNewBoard),
	print_board(MoreNewBoard),
	Other is ((1 mod 2) + 1),
	bot_1(Other, MoreNewBoard).

/*Bot to Play*/	
bot_2(2, Board) :-
	write('Bot to play: Player'), write(2), nl,
	player(2, Value),
	count_markers(Board, Value, Count),
	Count < 4,
	is_win_move(2, Board, [C, L| _]),
	player(2, Letter),
	put_marker(Board, L, C, Letter, NewBoard),
	print_board(NewBoard),
	Other is ((2 mod 2) + 1),
	bot_2(Other, NewBoard).
	
bot_2(2, Board) :-
	player(2, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	is_win_move(2, Board, [C, L, C1, L1| _]),
	check(C, L, C1, L1, 2, Board),
	put_marker(Board, L, C, e, NewBoard),
	put_marker(NewBoard, L1, C1, Letter, MoreNewBoard),
	print_board(MoreNewBoard),
	Other is ((2 mod 2) + 1),
	bot_2(Other, MoreNewBoard).

/* Valid Moves For Bot */
valid_moves(Player, Board, List) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count < 4,
	findall( [Col, Line], ( col(Col), line(Line), check_free_space(Board, Col, Line, Value), Value = 'e' ), List).

valid_moves(Player, Board, List) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	findall([	Col, Line, ColP, LineP], /* find this variables list format!!*/
			(	col(Col), line(Line), col(ColP), line(LineP), /* for this variables */
				check_free_space(Board, Col, Line, Value), Value = Letter, /* they must pick his own marker */
				check_free_space(Board, ColP, LineP, ValueP), ValueP = 'e', /* must place in a empty space */
				check_adjacent(Col, Line, ColP, LineP) /* and the moves must be adjacent */
			), List).
			
choose([], []).
choose(List, Elt) :-
	length(List, Length),
	random(0, Length, Index),
	nth0(Index, List, Elt).
			  
/* Choose the Win Move */
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count < 4,
	valid_moves(Player, Board, List),
	append(_, [H | _], List),
	H = [Col, Line],
	put_marker(Board, Line, Col, Letter, NewBoard),
	win(NewBoard, Letter), 
	Move = [Col, Line], !.
	
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	valid_moves(Player, Board, List),
	append(_, [H | _], List),
	H = [Col, Line, ColP, LineP],
	put_marker(Board, Line, Col, e, NewBoard),
	put_marker(NewBoard, LineP, ColP, Letter, MoreNewBoard),
	win(MoreNewBoard, Letter), 
	Move = [Col, Line, ColP, LineP], !.

/* Select a move that doesn't allow the other player to win */
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count < 4,
	Other is ((Player mod 2) + 1), 			/* pick valid moves for the other player */
	player(Other, LetterO),
	valid_moves(Other, Board, ListOther),
	append(_, [H | _], ListOther),
	H = [Col, Line],
	put_marker(Board, Line, Col, LetterO, NewBoard),
	win(NewBoard, LetterO), 				/* if there is a winning move */
	valid_moves(Player, Board, List), 		/* let's block */
	append(_, [H1 | _], List), 
	[Col, Line] = H1,
	Move = H1, !.
	
/* Select a move that doesn't allow the other player to win */
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	Other is ((Player mod 2) + 1),	/* pick valid moves for the other player */
	player(Other, LetterO),
	valid_moves(Other, Board, ListOther),
	append(_, [H | _], ListOther),
	H = [Col, Line, ColP, LineP],
	put_marker(Board, Line, Col, 'e', NewBoard),
	put_marker(NewBoard, LineP, ColP, LetterO, MoreNewBoard),
	win(MoreNewBoard, LetterO), 					/* if there is a winning move */
	valid_moves(Player, Board, List), 			/* let's block */
	append(_, [H1 | _], List), 
	H1 = [ _, _, ColP1, LineP1],			/* if there is a move that places a marker in that place */
	ColP = ColP1,
	LineP = LineP1,
	Move = H1, !.
	
/* Select the move that allow to have 3 markers in line */
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count < 4,
	valid_moves(Player, Board, List),
	append(_, [H | _], List),
	H = [Col, Line],
	put_marker(Board, Line, Col, Letter, NewBoard),
	win_3(NewBoard, Letter), 
	Move = [Col, Line], !.
	
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	valid_moves(Player, Board, List),
	append(_, [H | _], List),
	H = [Col, Line, ColP, LineP],
	put_marker(Board, Line, Col, e, NewBoard),
	put_marker(NewBoard, LineP, ColP, Letter, MoreNewBoard),
	win_3(MoreNewBoard, Letter), 
	Move = [Col, Line, ColP, LineP], !.
	
/* Select the move that allow to have 2 markers in line */
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count < 4,
	valid_moves(Player, Board, List),
	append(_, [H | _], List),
	H = [Col, Line],
	put_marker(Board, Line, Col, Letter, NewBoard),
	win_2(NewBoard, Letter), 
	Move = [Col, Line], !.
	
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	valid_moves(Player, Board, List),
	append(_, [H | _], List),
	H = [Col, Line, ColP, LineP],
	put_marker(Board, Line, Col, e, NewBoard),
	put_marker(NewBoard, LineP, ColP, Letter, MoreNewBoard),
	win_2(MoreNewBoard, Letter), 
	Move = [Col, Line, ColP, LineP], !.
	
/* Select Random Move */
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count < 4,
	valid_moves(Player, Board, List),
	choose(List, [C, L|_]),
	Move = [C,L].
	
is_win_move(Player, Board, Move) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	valid_moves(Player, Board, List),
	choose(List, [C, L, C1, L1|_]),
	Move = [C,L, C1, L1].