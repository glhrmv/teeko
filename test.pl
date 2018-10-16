/**/

board([
  [e, e, b, e, e],
  [e, e, b, w, b],
  [e, e, b, w, e],
  [e, w, w, e, e],
  [e, e, e, e, e]
]).

print_char(e) :- 
  write('_').
print_char(b) :- 
  write('B').
print_char(w) :- 
  write('W').

print_line([]).
print_line([Char | Chars]):-
  print_char(Char),
  print_line(Chars).

% display_game(+Board, +Player)
display_game([], _Player).
display_game([L | Ls], _Player) :-
  print_line(L),
  write('\n'),
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
