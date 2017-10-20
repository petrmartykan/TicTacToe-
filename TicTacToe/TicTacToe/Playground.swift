//
//  Playground.swift
//  TicTacToe
//
//  Created by Jan Vrabel on 10/20/17.
//  Copyright © 2017 Petr Martykan. All rights reserved.
//

import Foundation

class Playground {

    private let x:Int
    private let y:Int
    
    var toes: [[TicTac]] = []
    
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
        for _ in 0..<x {
            var t = [TicTac]()
            for _ in 0..<y {
                t.append(TicTac())
            }
            toes.append(t)
            
        }
    }
    
}
