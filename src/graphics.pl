/* Graphics */
display_board(Board) :-
	print_board(Board).
	
print_board(Board) :-
  nl,
  length(Board, Size),
  print_letters(Size, Size),
  print_top_lines(Size),
  print_squares(0, Size, Board),
  print_bottom_lines(Size).

/* Print letters on top of the board */
print_letters(Size, Size) :-
  Size > 0,
  write('    '),
  print_letter(Size, Size).

print_letter(1, Size) :-
  write(' '),
  C is 65+Size-1,
  put_code(C),
  write(' '), nl.

print_letter(Line, Size) :-
  write(' '),
  C is 65+Size-Line,
  put_code(C),
  write(' '),
  Nextline is Line-1,
  print_letter(Nextline, Size).

/* Print the top line of the board */
print_top_lines(Column) :-
  Column > 0,
  write('    '),
  lt_corner,
  print_top_line(Column).

print_top_line(1) :-
  horiz,
  horiz,
  rt_corner, nl.

print_top_line(Column) :-
  horiz,
  horiz,
  top_con,
  Nextcolumn is Column-1,
  print_top_line(Nextcolumn).

/* Print the bottom line line of the board */
print_bottom_lines(Column) :-
  Column > 0,
  write('    '),
  lb_corner,
  print_bottom_line(Column).

print_bottom_line(1) :-
  horiz,
  horiz,
  rb_corner, nl.

print_bottom_line(Column) :-
  horiz,
  horiz,
  bottom_con,
  NextColumn is Column-1,
  print_bottom_line(NextColumn).

/* Print the middle of the board */
print_squares(_, _, []).

print_squares(0, Size, [Line|Board]) :-
  print_markers(0, Size, Line),
  print_squares(1, Size, Board).

print_squares(Currentline, Size, [Line|Board]) :-
  print_middle_lines(Size),
  print_markers(Currentline, Size, Line),
  Nextline is Currentline+1,
  print_squares(Nextline, Size, Board).

/* Print the horizontal lines and connectors of the board */
print_middle_lines(Size) :-
  Size > 0,
  write('    '),
  left_con,
  print_middle_line(Size).

print_middle_line(1) :-
  horiz,
  horiz,
  right_con, nl.

print_middle_line(Size) :-
  horiz,
  horiz,
  middle,
  Nextsize is Size-1,
  print_middle_line(Nextsize).

/* Print the markers and the vertical lines */
print_markers(Currline, _, Line) :-
  write('  '),
  write(Currline),
  write(' '),
  print_marker(Line),
  vert, nl.

print_marker([]).

print_marker([e|Line]) :-
  vert,
  write('  '),
  print_marker(Line).

print_marker([o|Line]) :-
  vert,
  black_circle,
  write(' '),
  print_marker(Line).

print_marker([x|Line]) :-
  vert,
  white_circle,
  write(' '),
  print_marker(Line).

