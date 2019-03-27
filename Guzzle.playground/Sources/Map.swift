//
//  mapa.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 19/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

public struct Map {
    public var board: [Food]
    public var col: Int
    public var row: Int
    public var directionOfTheMap: Direccion
    public var morsel: Int
    public var steps: Int
    public var currentX: Int = 0
    public var currentY: Int = 0
    
    public init(col: Int, row: Int) {
        self.row = row
        self.col = col
        self.board = (0..<row*col).map { _ in Food.random() }
        self.morsel = 0
        self.steps = 0
        self.directionOfTheMap = Direccion.random()
    }
    
    public subscript(row: Int, col: Int) -> Food {
        get {
            return board[self.col * row + col]
        }
        set {
            board[self.col * row + col] = newValue
        }
    }
}
