//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Jan Vrabel on 10/20/17.
//  Copyright © 2017 Petr Martykan. All rights reserved.
//

import Foundation

class GameLogic {
    
    let playground:Playground = Playground(x:3, y:3)
    var activeTicTacType = TicTac.State.cross
    
    func start() {
        restart()
    }
    
    func restart() {
        activeTicTacType = TicTac.State.cross
    }
    
    func insertTicTac(position:(x:Int, y:Int)) {
        
        print("\n")
        let stateChanged = playground.changeTicTacState(state: activeTicTacType, position: position)
        
        if stateChanged == true {
            
            if(activeTicTacType == .cross) {
                activeTicTacType = .circle
                
            } else if(activeTicTacType == .circle) {
                activeTicTacType = .cross
            }
        }
        
        
    }
    
    
}

