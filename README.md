# Klotski_solver
Challenge from: https://www.youtube.com/watch?v=G_UYXzGuqvM

## Python

### recursive
Reursively makes moves, until a state is reached, that was already visited or the puzzle is solved.

### tree
Makes a tree, that adds children layer by layer. Leafes are states in which no further move is possible, that makes a unique state or the puzzle is solved.

## C++

Used the tree-implementation again, but it is quite slow, but i can't find which part sucks. Probably way more memory efficient than the python implementation, because I learned, hoe pointer, references and so on work.
