//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Jan Vrabel on 10/20/17.
//  Copyright © 2017 Petr Martykan. All rights reserved.
//

import Foundation

class GameLogic {
    
    let playground:Playground = Playground(x:1, y:1)
    var activeTicTacType = TicTac.State.cross
    
    func start() {
        restart()
    }
    
    func restart() {
        activeTicTacType = TicTac.State.cross
    }
    
    func insertTicTac(position:(x:Int, y:Int)) {
        
        let ticTac = playground.toes[position.x][position.y]
        ticTac.changeState(state: activeTicTacType)
        
        if(activeTicTacType == .cross) {
            activeTicTacType = .circle
        
        } else if(activeTicTacType == .circle) {
            activeTicTacType = .cross
        }
    }
}

