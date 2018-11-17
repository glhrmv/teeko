---
title: Logic Programming - Project 1
subtitle: Final Report - Teeko3
date: "November 2018"
author:
- Guilherme Vale (201709049)
- Pedro Azevedo (201306026)
institute: FEUP
keywords: [logic, prolog, game]

monofont: Source Code Pro
linkcolor: black
urlcolor: blue
numbersections: true
documentclass: scrartcl
bibliography: references.bib
---

\newpage

\tableofcontents

\newpage

# Introduction

The primary goal of this project is to design and develop a faithful recreation of the
board game **Teeko** using logic programming, specifically, using the programming language **Prolog**
and the [SICStus Prolog][1] development system.
The end result of the project should be a playable version of the game in a
[command-line interface (CLI)][2] inside the SICStus Prolog interactive shell.

The project was developed using **Git** for version control and an online GitHub repository
is available at [github.com/glhrmv/teeko][3], containing all of the work developed.

[1]: https://sicstus.sics.se/
[2]: https://en.wikipedia.org/wiki/Command-line_interface
[3]: https://github.com/glhrmv/teeko

\newpage

# Teeko

## Description

Teeko is an abstract strategy game invented by John Scarne in 1937 and re-released in refined
form in 1952 and again in the 1960s.
Teeko was marketed by Scarne's company, John Scarne Games Inc.;
its quirky name, he said, borrowed letters from Tic-tac-toe, Chess, Checkers, and Bingo [@teeko_etymology].

Teeko is a 2-player board game played on a board of 5x5 possible positions.
Game pieces in Teeko are typically called '**markers**', and will henceforth be referred to as such.
Both players have 4 markers each, with a particular colour of marker for each player.

In the original Teeko game, players had two (2) colours of markers: black, and red,
with the player controlling the black markers known as Black, and the other as Red.

![A Teeko game ready to be played.](img/teeko_irl.jpg){width=500px}

## Gameplay and rules

Teeko can be divided into two phases: the drop phase and the move phase.

The game starts on an empty board and the first phase, the **drop phase**, begins. It consists
of players taking turns placing their markers (4 for each, 8 total) into empty cells on the board,
with Black taking the first turn.
If a player isn't careful, they can risk defeat in the drop phase by not preventing the
opponent from placing their markers in a winning position.

If no player won in the drop phase, the **move phase** begins.
In the move phase, players take turns moving one of their markers until a winning position is found.
A game piece can only be moved to one empty adjacent space, in any direction (horizontal, vertical, or diagonal).

## Win condition

The game is over and a player is victorious only when their markers are arranged in a straight line in any
direction (horizontal, vertical, or diagonal) or when they form a square of four (4) adjacent markers.

![Black wins in this scenario.](img/teeko_board_example1.jpg){width=300px height=300px}

\pagebreak

# Game logic

The source code for this project was written iteratively, but with the everpresent aim of
modularizing all logic into its own respective file, e.g. all menu-related logic was
placed in `menu.pl`, etc.. The entry point of the game itself is located in `teeko.pl`,
wherein all of the SICStus Prolog standard library modules and the other source files
written are loaded. 

The following is all of the source code files used in development.

```
src/
├── board_state.pl
├── bot.pl
├── graphics.pl
├── input.pl
├── menu.pl
├── pvp.pl
├── rules.pl
├── teeko.pl
├── test.pl
└── utils.pl
```

Where:

- `board_state.pl` contains the initial game board definition.
- `bot.pl` contains all bot-related logic.
- `graphics.pl` contains all graphics-related logic, i.e., printing the game board onto the screen.
- `input.pl` contains all user input-related logic, e.g., parsing a user's desired position to move to.
- `menu.pl` contains the main menu logic.
- `pvp.pl` contains all player-related logic, e.g., moving pieces.
- `rules.pl` contains all rules-related logic
- `teeko.pl` is the entry point of the project, containing the `teeko/0` predicate that will initiate play.
- `utils.pl` contains miscellaneous utility predicates used throughout the project.

Some concessions had to be made regarding the representation of the players' markers
on the game board, due to the restricted nature of the command-line interface and due
to the usage of special Unicode characters to represent each player. 

Instead of having a 

## Board definition

The game board will be defined internally as a list of lists. Each element of
the outer list represents a row in the board, with each element of a row
corresponding to a cell, i.e., a position on the board.
Here are some examples of board states:

~~~prolog
/* Starting board: All cells are empty, defined by the atom e */
board([
  [e, e, e, e, e],
  [e, e, e, e, e],
  [e, e, e, e, e],
  [e, e, e, e, e],
  [e, e, e, e, e]
]).
~~~

~~~prolog
/* Intermediate board: Some markers on the board, neither player winning */
/* The atom b represents the Black markers */
/* The atom w epresents the White markers */
board([
  [e, e, b, e, e],
  [e, e, b, w, b],
  [e, e, b, w, e],
  [e, w, w, e, e],
  [e, e, e, e, e]
]).
~~~

~~~prolog
/* Finishing board: Black wins in this scenario */
board([
  [e, e, e, e, e],
  [e, w, b, e, e],
  [e, e, b, e, e],
  [e, w, b, w, e],
  [e, w, b, e, e]
]).
~~~

\newpage

## Board visualization

The game board will be defined as such, where:

- B represents a black marker
- W represents a white marker

~~~
    1   2   3   4   5
  ---------------------
a |   |   | W |   |   |
  ---------------------
b |   | B | W | W |   |
  ---------------------
c |   | W | B |   |   |
  ---------------------
d |   |   | B | B |   |
  ---------------------
e |   |   |   |   |   |
  ---------------------
~~~

In order to print this board on the screen, some Prolog predicates need to be defined.
The main predicate that will print the state of the game is named `display_game(+Board, +Player)`.
It will first print the board in a way similar to the example above, and then print
some information regarding what can be done from this state: either a winning condition is
found and victory is granted to the respective player and the game is over,
or it will display which player's turn it is to move.

This predicate has been implemented in the following way:

~~~prolog
~~~

## Valid moves

## Moving markers

## End of game detection

## Board state evaluation

## Computer movement

\newpage

# Conclusion

The usage of logic programming was very quickly appreciated for the way it trivializes
and simplifies otherwise very tedious processes and computations in more traditional, 
imperative programming languages, particularly when writing the logic to gather the 
list of valid moves, and checking the board state for a win condition.

There was an initial hurdle since there was very little prior experience with Prolog
before this project, but the results are gratifying and a new and invaluable insight 
into developing complex systems with several layers of internal logic was gained.

Some of the code can still be better modularised and refactored, along with the
usage of particular SICStus or ISO predicates that can simplify even more of
the game logic, making it shorter and more comprehensive.

\newpage
\setlength\parindent{0pt}

# References
