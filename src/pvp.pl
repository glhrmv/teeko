/* Player vs Player Mode */

play_pvp(Player, Board) :-
	write('To play: Player'), write(Player), nl.
	read_position_from(Player, Board, C, L),
	play_pvp(2, Board).