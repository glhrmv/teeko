/* Teeko */

/* Standard library */
:- use_module(library(system)).
:- use_module(library(random)).
:- use_module(library(lists)).

/* External files */
:- ensure_loaded('utils.pl').
:- ensure_loaded('graphics.pl').
:- ensure_loaded('rules.pl').
:- ensure_loaded('input.pl').
:- ensure_loaded('board_state.pl').
:- ensure_loaded('menu.pl').
:- ensure_loaded('pvp.pl').
:- ensure_loaded('bot.pl').

teeko :-
  main_menu.

