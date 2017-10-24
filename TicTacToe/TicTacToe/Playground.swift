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
    
    func getSize() -> (x: Int, y: Int) {
        return (x, y)
    }
    
    
    
    func changeTicTacState(state: TicTac.State, position: (x: Int, y: Int)) -> Bool {
        let ticTac = toes[position.x][position.y]
        let ticTacChanged = ticTac.changeState(state: state)
        printPlayground()
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
                    }
                }
            }
        }
        
        return .inProgress
    }
    
    func isPlaygroundFull() -> Bool {
        for x in toes {
            for tic in x {
                if tic.getState() == .empty {
                   return true
                }
                 else {
                    return false
                }
            }
        }
        return true || false
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
