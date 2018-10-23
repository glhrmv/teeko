/**/
 :-use_module(library(lists)).

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

/*
 display_game([
 [e, e, b, e, e],
 [e, e, b, w, b],
 [e, e, b, w, e],
 [e, w, w, e, e],
 [e, e, e, e, e]
 ], aaa).
*/
