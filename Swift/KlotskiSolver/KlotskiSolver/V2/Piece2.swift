//
//  Piece2.swift
//  KlotskiSolver
//
//  Created by Jonas Wattendorff on 09.08.22.
//

import Foundation

struct Piece2 : Hashable {
    var lowerLeftPos: (Int, Int)
    let kernel: [[Bool]]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(kernel)
    }
    
    static func == (lhs: Piece2, rhs: Piece2) -> Bool {
        return lhs.kernel == rhs.kernel
    }
}
