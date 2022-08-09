//
//  Node2.swift
//  KlotskiSolver
//
//  Created by Jonas Wattendorff on 09.08.22.
//

import Foundation

class Node2 : Board2 {
    var parentIndex: Int
    var selfIndex: Int
    
    init(boardSize: (Int, Int), piecesOnBoard: [Piece2], parentIndex: Int, selfIndex: Int) {
        self.parentIndex = parentIndex
        self.selfIndex = selfIndex
        super.init(boardSize: boardSize, piecesOnBoard: piecesOnBoard)
    }
    
    init(board: Board2, parentIndex: Int, selfIndex: Int) {
        self.parentIndex = parentIndex
        self.selfIndex = selfIndex
        super.init(boardSize: board.boardSize, piecesOnBoard: board.piecesOnBoard)
    }
    
    func makeChildren() -> [Node2] {
        var children: [Node2] = []
        
        for i in 0..<self.piecesOnBoard.count {
            
            // MINITREE
            
            var nodeQueue = [self]
            
            var j = 0
            while j < nodeQueue.count {
                for (delta_x, delta_y) in [(0, 1), (1, 0), (0, -1), (-1, 0)] {
                    if movableInDir(board: nodeQueue[j], index: i, UpRightDownLeft: (delta_x, delta_y)) {
                        var newPieces = nodeQueue[j].piecesOnBoard
                        newPieces[i].lowerLeftPos.0 += delta_x
                        newPieces[i].lowerLeftPos.1 += delta_y
                        let newNode = Node2(boardSize: nodeQueue[j].boardSize, piecesOnBoard: newPieces, parentIndex: self.selfIndex, selfIndex: -2)
                        
                        if !(nodeQueue.contains(newNode)) {
                            nodeQueue.append(newNode)
                        }
                    }
                }
                j += 1
            }
            children += nodeQueue[1...]
        }
        
        return children
    }
    
    func movableInDir(board: Board2, index: Int, UpRightDownLeft dir: (Int, Int)) -> Bool {
        let piece = board.piecesOnBoard[index]
        
        switch dir {
        case (1, 0):
            for y in 0..<piece.kernel[0].count {
                var x = piece.kernel.count-1
                while !piece.kernel[x][y] {
                    x -= 1
                }
                // out of bounds
                if x + piece.lowerLeftPos.0 + 1 >= boardSize.0 {
                    return false
                }
                // collision
                if board.mapOfBoard[x + piece.lowerLeftPos.0 + 1][y + piece.lowerLeftPos.1] != -1 {
                    return false
                }
            }
        case (-1, 0):
            for y in 0..<piece.kernel[0].count {
                var x = 0
                while !piece.kernel[x][y] {
                    x += 1
                }
                // out of bounds
                if x + piece.lowerLeftPos.0 - 1 < 0 {
                    return false
                }
                // collision
                if board.mapOfBoard[x + piece.lowerLeftPos.0 - 1][y + piece.lowerLeftPos.1] != -1 {
                    return false
                }
            }
        case (0, 1):
            for x in 0..<piece.kernel.count {
                var y = piece.kernel[0].count-1
                while !piece.kernel[x][y] {
                    y -= 1
                }
                // out of bounds
                if y + piece.lowerLeftPos.1 + 1 >= boardSize.1 {
                    return false
                }
                // collision
                if board.mapOfBoard[x + piece.lowerLeftPos.0][y + piece.lowerLeftPos.1 + 1] != -1 {
                    return false
                }
            }
        case (0, -1):
                for x in 0..<piece.kernel.count {
                    var y = 0
                    while !piece.kernel[x][y] {
                        y += 1
                    }
                    // out of bounds
                    if y + piece.lowerLeftPos.1 - 1 < 0 {
                        return false
                    }
                    // collision
                    if board.mapOfBoard[x + piece.lowerLeftPos.0][y + piece.lowerLeftPos.1 - 1] != -1 {
                        return false
                    }
                }
        default:
            assert(1==0)
            
        }
        return true
    }
}
