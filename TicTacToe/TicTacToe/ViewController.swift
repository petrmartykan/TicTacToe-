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
        logic.insertTicTac(position: (0, 2))
        logic.insertTicTac(position: (1, 0))
        logic.insertTicTac(position: (1, 1))
        logic.insertTicTac(position: (1, 2))
        logic.insertTicTac(position: (2, 0))
        logic.insertTicTac(position: (2, 1))
        logic.insertTicTac(position: (2, 2))
     
        
        
        
        
    }
    
    func printN (n: [TicTac]) {
        for i in n {
            print(i.getPosition())
        }
    }


}

