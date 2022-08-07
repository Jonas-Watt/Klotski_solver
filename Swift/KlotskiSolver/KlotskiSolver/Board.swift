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
    
    init(boardSize: (Int, Int), piecesOnBoard: [Piece]) {
        self.boardSize = boardSize
        self.piecesOnBoard = piecesOnBoard
        
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
        
        for i in 0..<piecesOnBoard.count {
            for (delta_x, delta_y) in [(0, 1), (1, 0), (0, -1), (-1, 0)] {
                if movableInDir(index: i, UpRightDownLeft: (delta_x, delta_y)) {
                    var newPieces = piecesOnBoard
                    newPieces[i].lowerLeftPos.0 += delta_x
                    newPieces[i].lowerLeftPos.1 += delta_y
                    
                    children.append(Board(boardSize: boardSize, piecesOnBoard: newPieces))
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
        for row in mapOfBoard {
            for square in row {
                hasher.combine(square)
            }
        }
    }
    
    static func == (lhs: Board, rhs: Board) -> Bool {
        return lhs.mapOfBoard == rhs.mapOfBoard
    }
}
