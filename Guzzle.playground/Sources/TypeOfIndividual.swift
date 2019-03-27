//
//  Operator.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 16/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

public enum TypeOfExecuter: CaseIterable {
    case progn2, progn3, sic
    
    var childCount: Int {
        switch self {
        case .progn2, .sic:
            return 2
        case .progn3:
            return 3
        }
    }
}

public enum TypeOfTerminal: CaseIterable  {
    case next, left, right
}

extension CaseIterable {
    public static func random() -> Self {
        return allCases.randomElement()!
    }
}
