/* Player vs Player Mode */

play_pvp(Player, Board) :-
	Other is ((Player mod 2) + 1),
	player(Other, Value),
	win(Board, Value),
	write(Other),
	write('GANHOU!!!!'),
	halt.


play_pvp(Player, Board) :-
	write('To play: Player'), write(Player), nl,
	player(Player, Value),
	count_pieces(Board, Value, Count),
	Count < 4,
	read_position_to(Player, Board, C, L),
	write(C),
	write(L),
	player(Player, Letter),
	put_piece(Board, L, C, Letter, NewBoard),
	print_board(5, NewBoard),
	Other is ((Player mod 2) + 1),
	play_pvp(Other, NewBoard).

play_pvp(Player, Board) :-
	player(Player, Value),
	count_pieces(Board, Value, Count),
	Count = 4,
	write('Next game phase').




