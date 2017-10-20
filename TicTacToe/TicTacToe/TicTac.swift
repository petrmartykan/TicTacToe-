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
    
    init() {
        state = .empty
    }
    
    func changeState(state:State) {
        
        if(self.state == .empty) {
            self.state = state
        } else {
            print("SI DEBIL TENTO TIC TAC UZ JE POUZITY!!! \(self.state)")
        }
    }
}
