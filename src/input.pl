/* READ GAME MODE */

get_menu_input(Option, Min, Max) :-
	get_code(O), skip_line,
	O > 47+Min, O < 49+Max,
	Option is O.

get_menu_input(Option, Min, Max) :- get_menu_input(Option, Min, Max).