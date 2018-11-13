/* Player vs Player Mode */

play_pvp(Player, Board) :-
	write('To play: Player'), write(Player), nl,
	read_position_to(Player, Board, C, L),
	write(C),
	write(L),
	player(Player, Letter),
	put_piece(Board, L, C, Letter, NewBoard),
	print_board(5, NewBoard),
	Other is ((Player mod 2) + 1),
	play_pvp(Other, NewBoard).