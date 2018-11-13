/* RULES */

/* Same piece cannot be placed at already existent piece */

check_free_space([L|_], Columm, 0, Value) :-
	check_free_space_c(L, Columm, Value).

check_free_space([_|Ls], Columm, Line, Value) :-
	Line > 0,
	L1 is Line - 1,
	check_free_space(Ls, Columm, L1, Value).

	
check_free_space_c([C | _], 0, Value) :-
	Value = C.
	
check_free_space_c([_|Cs], Columm, Value) :-
	Columm > 0,
	C1 is Columm - 1,
	check_free_space_c(Cs, C1, Value).