//
//  main.swift
//  KlotskiSolver
//
//  Created by Jonas Wattendorff on 26.07.22.
//

import Foundation

let kernel_1x1 = [[true]]
/*
    #
 */
let kernel_2x1 = [[true], [true]]
/*
    ##
 */
let kernel_1x2 = [[true, true]]
/*
    #
    #
 */
let kernel_2x2 = [[true, true], [true, true]]
/*
    ##
    ##
 */
let kernel_concave_1 = [[true, true], [false, true]]
/*
    ##
    #
 */
let kernel_concave_2 = [[false, true], [true, true]]
/*
    ##
     #
 */
let kernel_bridge_1 = [[true, true, true], [true, false, true]]
/*
    ##
    #
    ##
 */
let kernel_bridge_2 = [[true, false, true], [true, true, true]]
/*
    ##
     #
    ##
 */
let kernel_T = [[false, true], [true, true], [false, true]]
/*
    ###
     #
 */
/*
let pieces2 = [Piece(lowerLeftPos: (1, 3), kernel: kernel_2x2),
               Piece(lowerLeftPos: (2, 0), kernel: kernel_1x1),
               Piece(lowerLeftPos: (1, 0), kernel: kernel_concave_1),]

let board2 = Board(boardSize: (4, 5), piecesOnBoard: pieces2)
board2.printBoard()

let tree2 = Tree(rootBoard: board2, solution: (0, (1, 1)))
tree2.solveBoard()
tree2.printSolution()
 */

let pieces1 = [Piece(lowerLeftPos: (1, 4), kernel: kernel_T),
               Piece(lowerLeftPos: (1, 3), kernel: kernel_1x1),
               Piece(lowerLeftPos: (2, 3), kernel: kernel_1x1),
               Piece(lowerLeftPos: (3, 3), kernel: kernel_1x1),
               Piece(lowerLeftPos: (1, 1), kernel: kernel_1x1),
               Piece(lowerLeftPos: (3, 1), kernel: kernel_1x1),
               Piece(lowerLeftPos: (2, 0), kernel: kernel_1x1),
               Piece(lowerLeftPos: (2, 1), kernel: kernel_1x2),
               Piece(lowerLeftPos: (0, 0), kernel: kernel_bridge_1),
               Piece(lowerLeftPos: (3, 0), kernel: kernel_bridge_2),]

let board1 = Board(boardSize: (5, 6), piecesOnBoard: pieces1)
board1.printBoard()

let tree1 = Tree(rootBoard: board1, solution: (0, (1, 0)))

let pieces = [Piece(lowerLeftPos: (1, 3), kernel: kernel_2x2),
              Piece(lowerLeftPos: (0, 0), kernel: kernel_1x1),
              Piece(lowerLeftPos: (3, 0), kernel: kernel_1x1),
              Piece(lowerLeftPos: (1, 1), kernel: kernel_1x1),
              Piece(lowerLeftPos: (2, 1), kernel: kernel_1x1),
              Piece(lowerLeftPos: (0, 1), kernel: kernel_1x2),
              Piece(lowerLeftPos: (0, 3), kernel: kernel_1x2),
              Piece(lowerLeftPos: (3, 1), kernel: kernel_1x2),
              Piece(lowerLeftPos: (3, 3), kernel: kernel_1x2),
              Piece(lowerLeftPos: (1, 2), kernel: kernel_2x1),]
 
let board = Board(boardSize: (4, 5), piecesOnBoard: pieces)

let tree = Tree(rootBoard: board, solution: (0, (1, 0)))


tree.solveBoard()
tree.printSolution()
print("done")

// MORE HUMAN PLAYSTYLE: FIRST TRY LAST PIECE MOVED AGAIN AND IN THE SAME DIRECTION

// IMMOVABLE BLOCKS!!!!!!!!

