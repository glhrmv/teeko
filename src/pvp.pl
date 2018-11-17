/* Player logic */

play_pvp(Player, Board) :-
	Other is ((Player mod 2) + 1),
	player(Other, Value),
	win(Board, Value),
	write(Other),
	write('You won!').

play_pvp(Player, Board) :-
	write('To play: Player'), write(Player), nl,
	player(Player, Value),
	count_markers(Board, Value, Count),
	Count < 4,
	read_position_to(Player, Board, C, L),
	player(Player, Letter),
	put_marker(Board, L, C, Letter, NewBoard),
	print_board(NewBoard),
	Other is ((Player mod 2) + 1),
	play_pvp(Other, NewBoard).

play_pvp(Player, Board) :-
	player(Player, Letter),
	count_markers(Board, Letter, Count),
	Count = 4,
	read_position_from(Player, Board, C, L),
	read_position_to(Player, Board, C1, L1),
	check(C, L, C1, L1, Player, Board),
	put_marker(Board, L, C, e, NewBoard),
	put_marker(NewBoard, L1, C1, Letter, MoreNewBoard),
	print_board(MoreNewBoard),
	Other is ((Player mod 2) + 1),
	play_pvp(Other, MoreNewBoard).

