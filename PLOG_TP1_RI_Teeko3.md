---
title: "Programação Lógica - Trabalho Prático 1 \\ Relatório intercalar"
date: "2018/2019"
author:
- Guilherme Vale (201709049)
- Pedro Azevedo (201306026)
numbersections: true
bibliography: references.bib
---

\newpage

# Teeko

## Description

Teeko is an abstract strategy game invented by John Scarne in 1937 and re-released in refined
form in 1952 and again in the 1960s.
Teeko was marketed by Scarne's company, John Scarne Games Inc.;
its quirky name, he said, borrowed letters from Tic-tac-toe, Chess, Checkers, and Bingo.

Teeko is a 2-player board game played on a board of 5x5 possible positions. 
Game pieces in Teeko are typically called 'markers', and will henceforth be referred to as such.
Both players have 4 markers each, with a particular colour of marker for each player. 
With the intent of keeping with the original game's design, the markers are available in 
black and red, with the player controlling the black markers known as Black, and the other as Red.

## Gameplay and rules

Teeko can be divided into two phases: the drop phase and the move phase.

The game starts on an empty board and the first phase, the **drop phase**, begins. It consists
of players taking turns placing their markers (4 for each, 8 total) into empty cells on the board.
If a player isn't careful, they can risk defeat in the drop phase by not preventing the
opponent from placing their markers in a winning position.

If no player won in the drop phase, the **move phase** begins, with Black playing first.
In the move phase, players take turns moving one of their markers until a winning position is found.
A game piece can only be moved to an empty adjacent space.

## Win condition

The game is over and a player is victorious only when their markers are arranged in a straight line - either
vertical, horizontal, or diagonal - or when they form a square of four (4) adjacent positions.

\pagebreak

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

The board can be represented in a way similar to a Chess board, where
each position on the board has a particular name, based on its coordinates.

~~~
| a5 | b5 | c5 | d5 | e5 |
__________________________
| a4 | b4 | c4 | d4 | e4 |
__________________________
| a3 | b3 | c3 | d3 | e3 |
__________________________
| a2 | b2 | c2 | d2 | e2 |
__________________________
| a1 | b1 | c1 | d1 | e1 |
~~~

