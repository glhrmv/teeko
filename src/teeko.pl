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
:- ensure_loaded('rules.pl').

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
  double_vert, space(13), write('Select an option'), space(14), double_vert, nl,
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


