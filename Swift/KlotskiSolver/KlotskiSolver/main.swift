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

let piecesClassic = [Piece(lowerLeftPos: (1, 3), kernel: kernel_2x2),
                     Piece(lowerLeftPos: (0, 0), kernel: kernel_1x1),
                     Piece(lowerLeftPos: (3, 0), kernel: kernel_1x1),
                     Piece(lowerLeftPos: (1, 1), kernel: kernel_1x1),
                     Piece(lowerLeftPos: (2, 1), kernel: kernel_1x1),
                     Piece(lowerLeftPos: (0, 1), kernel: kernel_1x2),
                     Piece(lowerLeftPos: (0, 3), kernel: kernel_1x2),
                     Piece(lowerLeftPos: (3, 1), kernel: kernel_1x2),
                     Piece(lowerLeftPos: (3, 3), kernel: kernel_1x2),
                     Piece(lowerLeftPos: (1, 2), kernel: kernel_2x1),]

let boardClassic = Board(boardSize: (4, 5), piecesOnBoard: piecesClassic)

let treeClassic = Tree(rootBoard: boardClassic, solution: (0, (1, 0)))


let piecesPennant = [Piece(lowerLeftPos: (0, 3), kernel: kernel_2x2),
                     Piece(lowerLeftPos: (0, 2), kernel: kernel_1x1),
                     Piece(lowerLeftPos: (1, 2), kernel: kernel_1x1),
                     Piece(lowerLeftPos: (0, 0), kernel: kernel_1x2),
                     Piece(lowerLeftPos: (1, 0), kernel: kernel_1x2),
                     Piece(lowerLeftPos: (2, 0), kernel: kernel_2x1),
                     Piece(lowerLeftPos: (2, 1), kernel: kernel_2x1),
                     Piece(lowerLeftPos: (2, 3), kernel: kernel_2x1),
                     Piece(lowerLeftPos: (2, 4), kernel: kernel_2x1),]

let boardPennant = Board(boardSize: (4, 5), piecesOnBoard: piecesPennant)

let treePennant = Tree(rootBoard: boardPennant, solution: (0, (0, 0)))

treeClassic.solveBoard(breakAfterSolution: true)
treeClassic.printSolution()
print("done")
 */

let piecesClassic = [Piece2(lowerLeftPos: (1, 3), kernel: kernel_2x2),
                     Piece2(lowerLeftPos: (0, 0), kernel: kernel_1x1),
                     Piece2(lowerLeftPos: (3, 0), kernel: kernel_1x1),
                     Piece2(lowerLeftPos: (1, 1), kernel: kernel_1x1),
                     Piece2(lowerLeftPos: (2, 1), kernel: kernel_1x1),
                     Piece2(lowerLeftPos: (0, 1), kernel: kernel_1x2),
                     Piece2(lowerLeftPos: (0, 3), kernel: kernel_1x2),
                     Piece2(lowerLeftPos: (3, 1), kernel: kernel_1x2),
                     Piece2(lowerLeftPos: (3, 3), kernel: kernel_1x2),
                     Piece2(lowerLeftPos: (1, 2), kernel: kernel_2x1),]

let piecesPennant = [Piece2(lowerLeftPos: (0, 3), kernel: kernel_2x2),
                     Piece2(lowerLeftPos: (0, 2), kernel: kernel_1x1),
                     Piece2(lowerLeftPos: (1, 2), kernel: kernel_1x1),
                     Piece2(lowerLeftPos: (0, 0), kernel: kernel_1x2),
                     Piece2(lowerLeftPos: (1, 0), kernel: kernel_1x2),
                     Piece2(lowerLeftPos: (2, 0), kernel: kernel_2x1),
                     Piece2(lowerLeftPos: (2, 1), kernel: kernel_2x1),
                     Piece2(lowerLeftPos: (2, 3), kernel: kernel_2x1),
                     Piece2(lowerLeftPos: (2, 4), kernel: kernel_2x1),]

let piecesBig = [Piece2(lowerLeftPos: (1, 4), kernel: kernel_T),
                 Piece2(lowerLeftPos: (1, 3), kernel: kernel_1x1),
                 Piece2(lowerLeftPos: (2, 3), kernel: kernel_1x1),
                 Piece2(lowerLeftPos: (3, 3), kernel: kernel_1x1),
                 Piece2(lowerLeftPos: (1, 1), kernel: kernel_1x1),
                 Piece2(lowerLeftPos: (3, 1), kernel: kernel_1x1),
                 Piece2(lowerLeftPos: (2, 0), kernel: kernel_1x1),
                 Piece2(lowerLeftPos: (2, 1), kernel: kernel_1x2),
                 Piece2(lowerLeftPos: (0, 0), kernel: kernel_bridge_1),
                 Piece2(lowerLeftPos: (3, 0), kernel: kernel_bridge_2),]


var rootBig = Node2(boardSize: (5, 6), piecesOnBoard: piecesBig, parentIndex: -1, selfIndex: 0)

let treeBig = Tree2(rootBoard: rootBig, solution: (0, (1, 0)))

var root = Node2(boardSize: (4, 5), piecesOnBoard: piecesClassic, parentIndex: -1, selfIndex: 0)

let tree = Tree2(rootBoard: root, solution: (0, (1, 0)))

//tree.solveBoard(breakAfterSolution: true)
//tree.printSolution()

treeBig.solveBoard(breakAfterSolution: true)
treeBig.printSolution()
