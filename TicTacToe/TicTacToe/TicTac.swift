//
//  TicTac.swift
//  TicTacToe
//
//  Created by Jan Vrabel on 10/20/17.
//  Copyright © 2017 Petr Martykan. All rights reserved.
//

import Foundation


class TicTac {
    
    enum State {
        case empty
        case cross
        case circle
        
    }
    
    private var state:State
    
    private var x: Int
    private var y: Int
    
    init(x: Int, y: Int) {
        
        self.x = x
        self.y = y
        
        state = .empty
    }
    
    func changeState(state:State) -> Bool {
        
        if(self.state == .empty) {
            self.state = state
            return true
        } else {
            print("SI DEBIL TENTO TIC TAC UZ JE POUZITY!!! \(self.state)")
            return false
        }
    }
    func getState() -> State {
        return state
    }
    func getPosition() -> (x: Int, y: Int){
    return(x, y)
    }
}
