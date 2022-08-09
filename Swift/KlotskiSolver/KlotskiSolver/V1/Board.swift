//
//  Board.swift
//  KlotskiSolver
//
//  Created by Jonas Wattendorff on 26.07.22.
//

import Foundation

class Board : Hashable {
    let boardSize: (Int, Int)
    var piecesOnBoard: [Piece]
    var mapOfBoard: [[Int]]
    let previousMove: (Int, (Int, Int))
    
    init(boardSize: (Int, Int), piecesOnBoard: [Piece], previousMove: (Int, (Int, Int)) = (0, (0, 1))) {
        self.boardSize = boardSize
        self.piecesOnBoard = piecesOnBoard
        self.previousMove = previousMove
        
        mapOfBoard = Array(repeating: Array(repeating: -1, count: boardSize.1), count: boardSize.0)
        for piece in piecesOnBoard {
            for (x, column) in piece.kernel.enumerated() {
                for (y, isPiece) in column.enumerated() {
                    if isPiece {
                        mapOfBoard[x+piece.lowerLeftPos.0][y+piece.lowerLeftPos.1] = piece.hashValue
                    }
                }
            }
        }
    }
    
    func makeChildren() -> [Board] {
        var children: [Board] = []
        
        // try last move first
        var piecesIndex = (0..<piecesOnBoard.count).filter {$0 != previousMove.0}
        piecesIndex.insert(previousMove.0, at: 0)
        var dir = [(0, 1), (1, 0), (0, -1), (-1, 0)].filter {$0 != previousMove.1}
        dir.insert(previousMove.1, at: 0)
        
        for i in piecesIndex {
            for (delta_x, delta_y) in dir {
                if movableInDir(index: i, UpRightDownLeft: (delta_x, delta_y)) {
                    var newPieces = piecesOnBoard
                    newPieces[i].lowerLeftPos.0 += delta_x
                    newPieces[i].lowerLeftPos.1 += delta_y
                    
                    children.append(Board(boardSize: boardSize, piecesOnBoard: newPieces, previousMove: (i, ((delta_x, delta_y)))))
                }
            }
        }
        
        return children
    }
    
    func movableInDir(index: Int, UpRightDownLeft dir: (Int, Int)) -> Bool {
        let piece = piecesOnBoard[index]
        
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
                if mapOfBoard[x + piece.lowerLeftPos.0 + 1][y + piece.lowerLeftPos.1] != -1 {
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
                if mapOfBoard[x + piece.lowerLeftPos.0 - 1][y + piece.lowerLeftPos.1] != -1 {
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
                if mapOfBoard[x + piece.lowerLeftPos.0][y + piece.lowerLeftPos.1 + 1] != -1 {
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
                    if mapOfBoard[x + piece.lowerLeftPos.0][y + piece.lowerLeftPos.1 - 1] != -1 {
                        return false
                    }
                }
        default:
            assert(1==0)
            
        }
        return true
    }
    
    func printBoard() {
        var mapToPrint = Array(repeating: Array(repeating: "▢", count: boardSize.1), count: boardSize.0)
        var character: Int = 65
        for piece in piecesOnBoard {
            for (x, column) in piece.kernel.enumerated() {
                for (y, isPiece) in column.enumerated() {
                    if isPiece {
                        mapToPrint[x+piece.lowerLeftPos.0][y+piece.lowerLeftPos.1] = "\(Character(UnicodeScalar(character)!))"
                    }
                }
            }
            character += 1
        }
        
        for y in (0..<boardSize.1).reversed() {
            for row in mapToPrint {
                print(row[y], terminator: "")
            }
            print("")
        }
        print("")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(mapOfBoard)
    }
    
    static func == (lhs: Board, rhs: Board) -> Bool {
        return lhs.mapOfBoard == rhs.mapOfBoard
    }
}
