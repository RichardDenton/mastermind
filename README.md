# Mastermind
A Ruby implementation of the game [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game))

This was created as part of The Odin Project's [Curriculum](https://www.theodinproject.com/lessons/oop)

The game allows you to play as either the code setter, or the code breaker. When playing as the code setter
the computer will use Donald Knuth's five-guess algoritm and should be able to break any code within five guesses.
the algorithm is explained in the liked Wikipedia article.

When you play as the code breaker, the computer will set a random code for you to attempt to break.

The codes are four colours long with the colours being chosen from six possible colours. Repeated colours are allowed.

## Reflection
This project was created to proactice using OOP principles. The main challenges were implementing Donald Knuth's algorithm 
and creating an algorithm to generate the correct hints after each guess.
