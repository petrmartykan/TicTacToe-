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
    
    enum resultState {
        case inProgress
        case crossWinner
        case circleWinner
        case drawEnd
    }
    
    private var toes: [[TicTac]] = []
    
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
        for i in 0..<x {
            var t = [TicTac]()
            for z in 0..<y {
                t.append(TicTac(x: i, y: z))
            }
            toes.append(t)
            
        }
    }
    
    
    func printPlayground() {
        for i in toes {
            
            var line: String = ""
            
            
            
            for ticTac in i {
                let state = ticTac.getState()
                
                if state == .cross {
                    line.append("X")
                }
                else if state == .circle {
                    line.append("O")
                }
                else {
                    line.append("-")
                }
                
            }
            print(line)
        }
    }
    
    /*func playgroundCount() {
        for i in toes {
            
            var countCross = [Int]()
            var countCircle = [Int]()
            var count = [Int]()
            let numb = 0
            for ticTac in i {
                let state = ticTac.getState()
                
                if state == .cross {
                    countCross.append(numb + countCross.count)
                    print("Crosses count: \(countCross.count)")
                }
                else if state == .circle {
                    countCircle.append(numb + countCircle.count)
                    print("Circles count: \(countCircle.count)")
                }
                else {
                    count.append(numb + 1)
                    print("Empty count: \(count.count)")
                }
            }
        }
    }*/
    
    func getSize() -> (x: Int, y: Int) {
        return (x, y)
    }
    
    
    
    func changeTicTacState(state: TicTac.State, position: (x: Int, y: Int)) -> Bool {
        let ticTac = toes[position.x][position.y]
        let ticTacChanged = ticTac.changeState(state: state)
        printPlayground()
        
        let count = strikeBackCount()
        print(count)
        
        let result = getResultState()
        print(result)
        return ticTacChanged

    }
    
    func getResultState() -> resultState {
        for i in toes {
            for ticTac in i {
                let neighbors = findNeighbors(ticTac: ticTac)
                print(ticTac.getPosition())
                for neighbor in neighbors {
                    let oX = ticTac.getPosition().x + (ticTac.getPosition().x - neighbor.getPosition().x)
                    let oY = ticTac.getPosition().y + (ticTac.getPosition().y - neighbor.getPosition().y)
                    if oX >= 0 && oX < self.x && oY >= 0 && oY < self.y {
                        if ticTac.getState() == .cross {
                            return .crossWinner
                        } else if ticTac.getState() == .circle {
                            return .circleWinner
                        }
                        else if isPlaygroundFull() {
                            return .drawEnd
                        }
                        else if ticTac.getState() == .empty {
                            return .inProgress
                        }
                    }
                }
            }
        }
        return .inProgress
    }
    
    func isPlaygroundFull() -> Bool {
        
        //musis prejist celym playgroundom a ak narazis na .empty, znamena to, ze playground este nie je plny
        // v tvojom pripade vsak v situacii, ked narazi na prvy akykolvek circle alebo cross, tak vyhodnotis, ze playground je plny, co ale nemusi byt pravda, pretoze mozu byt este dalsie volne pozicie, ku ktorym sa tvoj FOR cyklus este ani edostal a skrz return uz ani nedostane - predebugguj si to riadok po riadku 
        
        //if ticTac.getState() == .cross || ticTac.getState() == .circle
        
        for i in toes {
            for ticTac in i {
              
                if ticTac.getState() == .empty {
                    print("TicTac je prázdný")
                    
                } else {
                    
                    print("TicTac je plný")
                    
                }
            }
        }
        return true
    }
    
    
    func strikeBackCount() -> (crossesCount: Int, circlesCount: Int, emptyCount: Int) {

        // zmenil som LET na VAR, aby som ich mohol pouzit ako pocitadla a pomenoval trosku zmysluplnejsie podla ich pouzitia
//        let xInt: Int = 0
//        let oInt: Int = 0
//        let emptyInt: Int = 0
        
        var xCounter: Int = 0
        var oCounter: Int = 0
        var emptyCounter: Int = 0
        
        // nie je potreba davat to do poli, potrebujes len count, na to ti postacia tie Int-y, ktore si si definoval
//        var cross = [Int]()
//        var circle = [Int]()
//        var empty = [Int]()
        
        for i in toes {
            for ticTac in i {
                let X = ticTac.getState() == .cross
                let O = ticTac.getState() == .circle
                
                if X {
//                    cross.append(xInt + 1)
                    xCounter = xCounter + 1
                }
                    
                else if O {
//                    circle.append(oInt + 1)
                    oCounter = oCounter + 1
                }
                    
                else {
//                    empty.append(emptyInt + 1)
                    emptyCounter = emptyCounter + 1
                }
            }
        }
        return (xCounter, oCounter, emptyCounter)
    }
    
    func findNeighbors (ticTac: TicTac) -> [TicTac] {
        return findNeighbors(x: ticTac.getPosition().x,
                             y: ticTac.getPosition().y, ticTacState: ticTac.getState())
    }
    
    func findNeighbors(x:Int, y:Int, ticTacState: TicTac.State) ->[TicTac] {
        print("Looking of n \(x, y)")
        var neighbors = [TicTac]()
        var nX = x - 1
        var nY = y - 1
        if nX >= 0 && nY >= 0 {
            
            if toes[nX][nY].getState() == ticTacState {
                neighbors.append(toes[nX][nY])
            }
           
        }
        
        nX = x
        nY = y - 1
        if nY >= 0 {
            if toes[nX][nY].getState() == ticTacState {
                neighbors.append(toes[nX][nY])
            }
        }
        
        nX = x + 1
        nY = y + 1
        
        if nX < self.x && nY < self.y {
            if toes[nX][nY].getState() == ticTacState {
                neighbors.append(toes[nX][nY])
            }
        }
        
        nX = x + 1
        nY = y - 1
        
        if nX < self.x && nY >= 0 {
            if toes[nX][nY].getState() == ticTacState {
                neighbors.append(toes[nX][nY])
            }
        }
        
        nX = x + 1
        nY = y
        
        if nX < self.x  {
            if toes[nX][nY].getState() == ticTacState {
                neighbors.append(toes[nX][nY])
            }
        }
        
        nX = x - 1
        nY = y
        
        if nX >= 0 {
            if toes[nX][nY].getState() == ticTacState {
                neighbors.append(toes[nX][nY])
            }
        }
        
        nX = x - 1
        nY = y + 1
        
        if nX >= 0 && nY < self.y {
            if toes[nX][nY].getState() == ticTacState {
                neighbors.append(toes[nX][nY])
            }
        }
        
        nX = x
        nY = y + 1
        
        if nY < self.y {
            if toes[nX][nY].getState() == ticTacState {
                neighbors.append(toes[nX][nY])
            }
        }


        return neighbors
    }
    
}
