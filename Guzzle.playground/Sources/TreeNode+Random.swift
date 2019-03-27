//
//  TreeNode+Random.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 24/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

extension TreeNode {
    /* This function return if the node has the heigth of one that mean that is a terminal
     - Usage:
        treeNode.isLeaf()
     - Returns: Bool
     */
    public func isLeaf() -> Bool {
        return self.height() == 1
    }
    
    /*This function is in charge of looking for a non-leaf node
     in the tree node and returning it
     - Usage:
        randomNode()
     
     - Returns: TreeNode
     */
    public func randomNode() -> TreeNode {
        guard !isLeaf() else {
            return self
        }
        
        var node: TreeNode?
        while node == nil {
            node = randomNodeHelper()
        }
        return node!
    }
    
    /* This function helps randomNode choose a node depending on the probability of selection
     
     - Usage:
        randomNodeHelper()
     
     - Returns: TreeNode or nil
     */
    public func randomNodeHelper() -> TreeNode? {
        let random = Double.random(in: 0...1)
        guard random > probabilityOfCrossing else {
            return self
        }
        
        guard case .executor(_, let childs) = type else {
            return nil
        }
        
        for child in childs {
            if let node = child.randomNodeHelper() {
                return node
            }
        }
        return nil
    }
}
