//
//  ViewController.swift
//  TicTacToe
//
//  Created by Petr Martykan on 20.10.17.
//  Copyright © 2017 Petr Martykan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var logic:GameLogic!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        print("TIC TAC TOE")
        
        logic = GameLogic()
        logic.start()
        
        logic.insertTicTac(position: (0, 0))
        logic.insertTicTac(position: (0, 1))
        logic.insertTicTac(position: (1, 0))
        logic.insertTicTac(position: (0, 0))
        logic.insertTicTac(position: (0, 1))
        logic.insertTicTac(position: (1, 0))
        logic.insertTicTac(position: (0, 0))
        logic.insertTicTac(position: (0, 1))
        logic.insertTicTac(position: (1, 0))
     
        
        var n = logic.playground.findNeighbors(x: 0, y: 0)
        printN(n: n)
        n = logic.playground.findNeighbors(x: 0, y: 1)
        printN(n: n)
        n = logic.playground.findNeighbors(x: 0, y: 2)
        printN(n: n)
        n = logic.playground.findNeighbors(x: 1, y: 0)
        printN(n: n)
        n = logic.playground.findNeighbors(x: 1, y: 1)
        printN(n: n)
        n = logic.playground.findNeighbors(x: 1, y: 2)
        printN(n: n)
        n = logic.playground.findNeighbors(x: 2, y: 0)
        printN(n: n)
        n = logic.playground.findNeighbors(x: 2, y: 1)
        printN(n: n)
        n = logic.playground.findNeighbors(x: 2, y: 2)
        printN(n: n)
        
        
    }
    
    func printN (n: [TicTac]) {
        for i in n {
            print(i.getPosition())
        }
    }


}

