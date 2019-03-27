//
//  Direction.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 24/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

/* This list is responsible for associating a number with the coordinates and changing it depending on the one already assigned.
 */
public enum Direccion: CaseIterable {
    case east, west, north, south
    
    public var xValue: Int {
        switch self {
        case .east:
            return 1
        case .west:
            return -1
        case .north, .south:
            return 0
        }
    }
    
    public var yValue: Int {
        switch self {
        case .south:
            return 1
        case .north:
            return -1
        case .east, .west:
            return 0
        }
    }
    
    public mutating func turnLeft() {
        switch self {
        case .east:
            self = .north
        case .west:
            self = .south
        case .north:
            self = .west
        case .south:
            self = .east
        }
    }
    
    public mutating func turnRight() {
        switch self {
        case .east:
            self = .south
        case .west:
            self = .north
        case .north:
            self = .east
        case .south:
            self = .west
        }
    }
}
