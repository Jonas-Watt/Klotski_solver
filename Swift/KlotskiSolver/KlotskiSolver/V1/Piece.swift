//
//  Piece.swift
//  KlotskiSolver
//
//  Created by Jonas Wattendorff on 26.07.22.
//

import Foundation

struct Piece : Hashable {
    var lowerLeftPos: (Int, Int)
    let kernel: [[Bool]]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(kernel)
    }
    
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.kernel == rhs.kernel
    }
}


