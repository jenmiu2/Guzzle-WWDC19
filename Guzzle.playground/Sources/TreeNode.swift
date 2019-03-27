//
//  treeNode.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 16/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

public class TreeNode {
    weak var parent: TreeNode?
    var type: TreeNodeType {
        didSet {
            updateChildParentsIfNeeded()
        }
    }
    
    public init(type: TreeNodeType, parent: TreeNode? = nil) {
        self.type = type
        self.parent = parent
        updateChildParentsIfNeeded()
    }
    
    /* This function update the parent of this tree node
     
     - Usage:
        treeNode.selectionByTruncation()
     */
    func updateChildParentsIfNeeded() {
        if case .executor(_, let childs) = type {
            for child in childs {
                child.parent = self
            }
        }
    }
    
    /* This function calculate the height of this tree node for that it acumulate the value of the lower nodes
     - Usage:
        treeNode.height()
     */
    public func height() -> Int {
        switch type {
        case .terminal:
            return 1
        case .executor(_, let childs):
            return childs.map { $0.height() }.max()! + 1
        }
    }
    
}

public enum TreeNodeType {
    case terminal(TypeOfTerminal)
    case executor(TypeOfExecuter, childs: [TreeNode])
}
