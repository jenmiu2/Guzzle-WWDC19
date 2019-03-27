//
//  Map+Execute.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 24/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

extension Map {
    /* This function is responsible for running the node to check if there is food in its position and then recursive call and execute the terminals
     
     - Usage:
        execute(node: TreeNode)
     
     - Parameter:
        - node: TreeNode
     */
    public mutating func execute(node: TreeNode) {
        if thereIsFood(posX: currentX, posY: currentY) {
            self[currentX, currentY] = .empty
            morsel += 1
        }
        
        switch node.type {
        case .terminal(let terminal):
            switch terminal {
            case .next:
                advance()
            case .left:
                turnLeft()
            case .right:
                turnRight()
            }
        case .executor(let `operator`, let childs):
            switch `operator` {
            case .progn2, .progn3:
                childs.forEach { execute(node: $0) }
            case .sic:
                if possibleFoodNextToMe() {
                    execute(node: childs[0])
                }
                else {
                    execute(node: childs[1])
                }
            }
        }
    }
    
    public mutating func turnLeft() {
        steps += 1
        directionOfTheMap.turnLeft()
    }
    
    public mutating func turnRight() {
        steps += 1
        directionOfTheMap.turnRight()
    }
    /* Change the current position of the node
     - Usage:
        advance()

     */
    public mutating func advance() {
        steps += 1
        currentX = nextX()
        currentY = nextY()
    }

    /* Check if there is food in a position
     - Warning: posX and posY need to be inside of the map
     - Usage:
        thereIsFood(posX: Int, posY: Int)
     
     */
    public func thereIsFood(posX: Int, posY: Int) -> Bool {
        return self[posX,posY] == .food
    }
    
    /* Check if there is food in the position next to the node
     
     - Usage:
        possibleFoodNextToMe()
     
     */
    public func possibleFoodNextToMe() -> Bool {
        let tempX = nextX()
        let tempY = nextY()
        return thereIsFood(posX: tempX, posY: tempY)
    }
    
    /* Calculate the position to move
     - Usage:
       - value = nextX()
     - Return:
        - result: Int
     */
    public func nextX() -> Int {
        let result = currentX + directionOfTheMap.xValue
        if result >= row {
            return 0
        } else if result < 0 {
            return row - 1
        }
        return result
    }
    
    /* Calculate the position to move
     - Usage:
        - value = nextY()
     - Return:
        - result: Int
     */
    public func nextY() -> Int {
        let result = currentY + directionOfTheMap.yValue
        if result >= col {
            return 0
        } else if result < 0 {
            return col - 1
        }
        return result
    }
}


public enum Food: CaseIterable {
    case food, empty
}
