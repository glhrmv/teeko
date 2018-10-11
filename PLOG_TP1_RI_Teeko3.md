---
title: "Programação Lógica - Trabalho Prático 1 \\ Relatório intercalar"
date: "2018/2019"
author:
- Guilherme Vale (201709049)
- Pedro Azevedo (201306026)
numbersections: true
---

\newpage

# Teeko

## Game description

Teeko is an abstract strategy game invented by John Scarne in 1937 and rereleased in refined form in 1952 and again in the 1960s.
Teeko was marketed by Scarne's company, John Scarne Games Inc.; its quirky name, he said, borrowed letters from Tic-tac-toe,
Chess, Checkers, and Bingo.

## Rules

The Teeko board consists of twenty-five spaces arranged in a five-by-five grid.
There are eight markers in a Teeko game, four black and four red.
One player, "Black" plays the black markers, and the other, "Red", plays the red.
Black moves first and places one marker on any space on the board.
Red then places a marker on any unoccupied space; black does the same; and so on until all eight markers are on the board.
The object of the game is for either player to win by having all four of his markers in a straight line
(vertical, horizontal, or diagonal) or on a square of four adjacent spaces.
(Adjacency is horizontal, vertical, or diagonal, but does not wrap around the edges of the board.)
If neither player has won after the "drop" (when all eight pieces are on the board),
then they move their pieces one at a time, with Black playing first.
A piece may be moved only to an adjacent space.

- 4 Black Pieces
- 4 Red Pieces
- Black first
- Put all pieces until all done
- Move a piece per round 
- Win condition: Form 4 pieces in line, diagonal or making a square.

## Definition of game state

~~~
/* Board def */
board([
  0, 0, 0, 0, 0,
  0, 0, 0, 0, 0,
  0, 0, 0, 0, 0,
  0, 0, 0, 0, 0,
  0, 0, 0, 0, 0
]).

player('B', 'Black player').
player('R', 'Red player').

playerVal('B', 1).
playerVal('R', 2).
~~~

## Board visualization

~~~
| A1  | A2  | A3  | A4  | A5  |
_______________________________
| A6  | A7  | A8  | A9  | A10 |
_______________________________
| A11 | A12 | A13 | A14 | A15 |
_______________________________
| A16 | A17 | A18 | A19 | A20 |
_______________________________
| A21 | A22 | A23 | A24 | A25 |
~~~

