//
//  TreeNode+Initialitation.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 24/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

extension TreeNode {
    /* This function initialize the TreeNode selecting random operator until a depth then it select random terminal
     - Warning: maxDepth more than 1 and depth needs to be 0 or more on the recursive call
     
     - Usage:
        init(depth: 0, maxDepth: 10)
     
     - Parameter:
         - depth: integer number of the actual depth
         - maxDepth: integer number of the maximun depth
     */
    public convenience init(depth: Int = 0, maxDepth: Int) {
        
        if depth < maxDepth {
            let op = TypeOfExecuter.random()
            let childs = (0..<op.childCount).map { _ in TreeNode(depth: depth + 1, maxDepth: maxDepth) }
            self.init(type: .executor(op, childs: childs))
        }
        else {
            let ter = TypeOfTerminal.random()
            self.init(type: .terminal(ter))
        }
    }
}

