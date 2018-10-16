/**/
:-use_module(library(lists)).
	
board([
  [e, e, e, e, e],
  [e, e, e, e, e],
  [e, e, e, e, e],
  [e, e, e, e, e],
  [e, e, e, e, e]
]).

count_elements([],0).
count_elements([_|Tail], N) :-    
	count_elements(Tail, X),
	N is X+1.
	
print_letter(4) :-
	write(' A ').
print_letter(3) :-
	write(' B ').
print_letter(2) :-
	write(' C ').
print_letter(1) :-
	write(' D ').
print_letter(0) :-
	write(' E ').
	
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
	print_letter(Y),
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
