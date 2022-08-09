//
//  Board2.swift
//  KlotskiSolver
//
//  Created by Jonas Wattendorff on 09.08.22.
//

import Foundation

class Board2 : Hashable {
    let boardSize: (Int, Int)
    var piecesOnBoard: [Piece2]
    var mapOfBoard: [[Int]]
    
    init(boardSize: (Int, Int), piecesOnBoard: [Piece2]) {
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
    
    static func == (lhs: Board2, rhs: Board2) -> Bool {
        return lhs.mapOfBoard == rhs.mapOfBoard
    }
}
