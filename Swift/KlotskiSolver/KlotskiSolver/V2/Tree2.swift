//
//  Tree2.swift
//  KlotskiSolver
//
//  Created by Jonas Wattendorff on 09.08.22.
//

import Foundation

class Tree2 {
    var nodeQueue: [Node2] = []
    var visitedBorads = Set<Int>()
    let solution: (Int, (Int, Int))
    var solutionIndex: Int?
    
    init(rootBoard: Board2, solution: (Int, (Int, Int))) {
        self.solution = solution
        nodeQueue.append(Node2(board: rootBoard, parentIndex: -1, selfIndex: 0))
        visitedBorads.insert(nodeQueue[0].hashValue)
        
    }
    
    func solveBoard(breakAfterSolution: Bool) {
        var i = 0
        
        while i != nodeQueue.count {
            if solutionIndex == nil {
                if nodeQueue[i].piecesOnBoard[solution.0].lowerLeftPos == solution.1 {
                    solutionIndex = i
                    if breakAfterSolution {
                        return
                    }
                }
            }
            for child in nodeQueue[i].makeChildren() {
                if !(visitedBorads.contains(child.hashValue)) {
                    nodeQueue.append(Node2(board: child, parentIndex: i, selfIndex: nodeQueue.count))
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
            var solutionMoves: [Board2] = []
            
            while i != -1 {
                solutionMoves.insert(nodeQueue[i], at: 0)
                i = nodeQueue[i].parentIndex
            }
            for board in solutionMoves {
                board.printBoard()
            }
            print("It takes \(solutionMoves.count-1) moves.")
        }
        
    }
}

