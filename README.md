# Klotski_solver
Challenge from: https://www.youtube.com/watch?v=G_UYXzGuqvM

## Python

### recursive
Reursively makes moves, until a state is reached, that was already visited or the puzzle is solved.

### tree
Makes a tree, that adds children layer by layer. Leafes are states in which no further move is possible, that makes a unique state or the puzzle is solved.

## C++

### v.1

Used the tree-implementation again, but it is quite slow (around a minute), but i can't find which part sucks. Probably way more memory efficient than the python implementation (around 13 MB), because I learned, how pointer, references and so on work.

### v.2

<<<<<<< Updated upstream
Used the boost library to hash the board states and made the generation of children more efficient, got the time under 2 seconds, but had to increase the total memory footprint to around 20 MB.
=======
Used the boost library to hash the board states and made the generation of children more efficient, got the time under 0.5 seconds, but had to increase the total memory footprint to around 29 MB.
>>>>>>> Stashed changes
