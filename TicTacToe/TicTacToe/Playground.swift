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
                        else if ticTac.getState() == .empty {
                            return .inProgress
                        }
                        else if isPlaygroundFull() {
                            return .drawEnd
                        }
                    }
                }
            }
        }
        return .inProgress
    }
    
    func isPlaygroundFull() -> Bool {
        
        for i in toes {
            for ticTac in i {
              
                if ticTac.getState() == .empty {
                    print("TicTac je prázdný")
                    return false
                } else if ticTac.getState() == .cross || ticTac.getState() == .circle {
                    print("TicTac je plný")
                    return true
                }
            }
        }
        return true
    }
    
    
    func strikeBackCount() -> (crossesCount: Int, circlesCount: Int, emptyCount: Int) {
        let xInt: Int = 0
        let oInt: Int = 0
        let emptyInt: Int = 0
        var cross = [Int]()
        var circle = [Int]()
        var empty = [Int]()
        for i in toes {
            for ticTac in i {
                let X = ticTac.getState() == .cross
                let O = ticTac.getState() == .circle
                
                if X {
                    cross.append(xInt + 1)
                }
                    
                else if O {
                    circle.append(oInt + 1)
                }
                    
                else {
                    empty.append(emptyInt + 1)
                }
            }
        }
        return (cross.count, circle.count, empty.count)
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
