/* Main menu */

main_menu :-
  print_menu,
  print_prompt,
  read(Input), skip_line,
  parse_option(Input).

print_menu :-
  nl,
  double_lt_corner, double_horiz(37), double_rt_corner, nl,
  double_vert, space(37), double_vert, nl,
  double_vert, space(16), write('TEEKO'), space(16), double_vert, nl,
  double_vert, space(18), write('by'), space(17), double_vert, nl,
  double_vert, space(11), write('Pedro Azevedo'), space(13), double_vert, nl,
  double_vert, space(11), write('Guilherme Vale'), space(12), double_vert, nl,
  double_vert, space(37), double_vert, nl,
  double_left_con, double_horiz(37), double_right_con, nl,
  double_vert, space(7), write('(1) Player vs. Player'), space(9), double_vert, nl,
  double_vert, space(7), write('(2) Player vs. CPU(1)'), space(9), double_vert, nl,
  double_vert, space(7), write('(3) Player vs. CPU(2)'), space(9), double_vert, nl,
  double_vert, space(7), write('(4) CPU vs. CPU'), space(15), double_vert, nl,
  double_vert, space(7), write('(0) Quit'), space(22), double_vert, nl,
  double_lb_corner, double_horiz(37), double_rb_corner, nl,
  %write('┌────────────────────────────────────────┐'), nl,
  %write('│               Welcome to               │'), nl,
  %write('│                                        │'), nl,
  %write('│                 TEEKO                  │'), nl,
  %write('│                                        │'), nl,
  %write('│                   by                   │'), nl,
  %write('│             Pedro Azevedo              │'), nl,
  %write('│             Guilherme Vale             │'), nl,
  %write('├────────────────────────────────────────┤'), nl,
  %write('│         (1) Player vs Player           │'), nl,
  %write('│         (2) Player vs Computer(1)      │'), nl,
  %write('│         (3) Player vs Computer(2)      │'), nl,
  %write('│         (4) Computer vs Computer       │'), nl,
  %write('│         (0) Quit                       │'), nl,
  %write('└────────────────────────────────────────┘'), nl,
  nl.

print_prompt :-
  write('> ').

parse_option(1) :-
  board(B),
  nl, nl,
  write('Player1 -> '), black_circle, write('\t'),
  write('Player2 -> '), white_circle, nl,
  print_board(B), nl,
  play_pvp(1, B),
  main_menu.

parse_option(2) :-
  board(B),
  nl, nl,
  write('Player1 -> '), black_circle, write('\t'),
  write('Player2 -> '), white_circle, nl,
  print_board(B), nl,
  bot_1(1, B),
  main_menu.
  
 parse_option(3) :-
  board(B),
  nl, nl,
  write('Player1 -> '), black_circle, write('\t'),
  write('Player2 -> '), white_circle, nl,
  print_board(B), nl,
  bot_2(1, B),
  main_menu.

parse_option(4) :-
  board(B),
  nl, nl,
  write('Player1 -> '), black_circle, write('\t'),
  write('Player2 -> '), white_circle, nl,
  print_board(B), nl,
  bot_3(1, B),
  main_menu.

parse_option(0) :-
  write('Quitting...'), nl,
  halt.

parse_option(_) :-
  write('Invalid option; try again.'), nl,
  print_prompt,
  read(Input),
  parse_option(Input).

