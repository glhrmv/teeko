/* Teeko */

/* Standard library */
:- use_module(library(system)).
:- use_module(library(random)).
:- use_module(library(lists)).

/* External files */
:- ensure_loaded('board_state.pl').
:- ensure_loaded('utils.pl').
:- ensure_loaded('graphics.pl').
:- ensure_loaded('input.pl').
:- ensure_loaded('pvp.pl').


teeko :-
	nl,
	double_lt_corner, double_horiz(37), double_rt_corner, nl,
	double_vert, space(37), double_vert, nl,
	double_vert, space(11), write('WELCOME TO TEEKO'), space(10), double_vert, nl,
	double_vert, space(37), double_vert, nl,
	double_left_con, double_horiz(37), double_right_con, nl,
	main_menu.
	
main_menu :-
	double_vert, space(37), double_vert, nl,
	double_vert, space(13), write('Game Modes'), space(14), double_vert, nl,
	double_vert, space(37), double_vert, nl,
	double_vert, space(8), write('1. Player vs. Player'), space(9), double_vert, nl,
	double_vert, space(8), write('2. Player vs. CPU'), space(12), double_vert, nl,
	double_vert, space(8), write('3. CPU vs. CPU'), space(15), double_vert, nl,
	double_vert, space(8), write('4. Quit'), space(22), double_vert, nl,
	double_vert, space(37), double_vert, nl,
	double_lb_corner, double_horiz(37), double_rb_corner, nl,
	get_menu_input(Option, 1, 4),
	NOption is Option-48,
	play_mode(NOption).
	
play_mode(1) :-
	board(B),
	nl, nl,
	write('Player1 -> '), black_circle, write('   '),
	write('Player2 -> '), white_circle, nl,
	print_board(5, B), nl,
	play_pvp(1, B).

play_mode(4) :-
  halt.

count_elements([],0).
count_elements([_|Tail], N) :-
	count_elements(Tail, X),
	N is X+1.

% Board grid characters
print_char(4) :-
	write(' a ').
print_char(3) :-
	write(' b ').
print_char(2) :-
	write(' c ').
print_char(1) :-
	write(' d ').
print_char(0) :-
	write(' e ').

% Board space characters
print_char(e) :-
	write(' ').
print_char(b) :-
	write('B').
print_char(w) :-
	write('W').

 
% display_game(+Board, +Player)
display_game([], _Player):-
	write('   ---------------------'),
	write('\n').

display_game([L | Ls], _Player) :-
	count_elements(Ls, Y),
	(Y =:= 4 ->
	write('\n     1   2   3   4   5  \n'),
	write('   ---------------------')
	; write('   ---------------------')
	),
	write('\n'),
	print_char(Y),
	print_line(L),
	display_game(Ls, _Player).

get_board(X) :-
	board(X).

move_piece(X, Y, Letter,R) :-
	board(B) ,
	find_line(B, X, Y, Letter, R).

find_line( [L|Ls] , 0 , Y , Z , [R|Ls] ) :-
	find_column(L,Y,Z,R).

find_line( [L|Ls] , X , Y , Z , [L|Rs] ) :-
	X > 0 ,
	X1 is X-1 ,
	find_line( Ls , X1 , Y , Z , Rs ).

find_column( [_|Cs] , 0 , Z , [Z|Cs] ).
find_column( [C|Cs] , Y , Z , [C|Rs] ) :-
	Y > 0 ,
	Y1 is Y-1 ,
	find_column( Cs , Y1 , Z , Rs ).
