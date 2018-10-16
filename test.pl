/**/

x is 1.

board([
  [e, e, b, e, e],
  [e, e, b, w, b],
  [e, e, b, w, e],
  [e, w, w, e, e],
  [e, e, e, e, e]
]).

print_char(e) :- 
  write(' ').
print_char(b) :- 
  write('B').
print_char(w) :- 
  write('W').

print_line([]):-
	write('|'),
	write('\n').
	
print_line([Char | Chars]):-
  write('| '),
  print_char(Char),
  write(' '),
  print_line(Chars).

% display_game(+Board, +Player)
display_game([], _Player):-
	write('---------------------'),
	write('\n').
	
display_game([L | Ls], _Player) :-
  write('---------------------'),
  write('\n'),
  %vwrite(x),
  print_line(L),
  display_game(Ls, _Player).

/*
display_game([
  [e, e, b, e, e],
  [e, e, b, w, b],
  [e, e, b, w, e],
  [e, w, w, e, e],
  [e, e, e, e, e]
  ], aaa).
*/
