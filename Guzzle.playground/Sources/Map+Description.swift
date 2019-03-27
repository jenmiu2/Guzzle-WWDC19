//
//  Map+Description.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 24/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

extension Map: CustomStringConvertible {
    public var description: String {
        var tablero = ""
        
        for row in 0..<row {
            tablero += "|"
            for col in 0..<col   {
                if row == currentX && col == currentY {
                    tablero += "H"
                }
                else if self[row,col] == .food {
                    tablero += "*"
                }
                else {
                    tablero += " "
                }
            }
            tablero += "|\n"
        }
        return tablero
    }
}
