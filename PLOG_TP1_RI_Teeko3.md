---
title: "Programação Lógica - Trabalho Prático 1 \\ Relatório intercalar"
date: "2018/2019"
author: 
- Guilherme Vale (201709049)
- Pedro Azevedo (201306026)
institute: FEUP
numbersections: true
---

\newpage

# Game description

## Game board

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

## Rules

- 4 Black Pieces
- 4 Red Pieces
- Black first
- Put all pieces until all done

## Values

~~~
/* Board def */
board([0, 0, 0, 0, 0,
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
