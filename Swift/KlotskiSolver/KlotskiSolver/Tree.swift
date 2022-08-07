//
//  Tree.swift
//  KlotskiSolver
//
//  Created by Jonas Wattendorff on 27.07.22.
//

import Foundation

class Tree {
    var boardQueue: [Node] = []
    var visitedBorads = Set<Int>()
    let solution: (Int, (Int, Int))
    var solutionIndex: Int?
    
    init(rootBoard: Board, solution: (Int, (Int, Int))) {
        self.solution = solution
        boardQueue.append(Node(parentIndex: -1, board: rootBoard))
        visitedBorads.insert(boardQueue[0].board.hashValue)
        
    }
    
    func solveBoard() {
        var i = 0
        
        while i != boardQueue.count {
            if solutionIndex == nil && boardQueue[i].board.piecesOnBoard[solution.0].lowerLeftPos == solution.1 {
                solutionIndex = i
                //return
            }
            for child in boardQueue[i].board.makeChildren() {
                if !(visitedBorads.contains(child.hashValue)) {
                    boardQueue.append(Node(parentIndex: i, board: child))
                    visitedBorads.insert(child.hashValue)
                }
            }
            i += 1
        }
    }
    
    func printSolution() {
        if solutionIndex == nil {
            print("No solution availabel")
        }
        else {
            var i = solutionIndex!
            var solutionMoves: [Board] = []
            
            while i != -1 {
                solutionMoves.insert(boardQueue[i].board, at: 0)
                i = boardQueue[i].parentIndex
            }
            for board in solutionMoves {
                board.printBoard()
            }
            print("It takes \(solutionMoves.count-1) moves.")
        }
        
    }
}
