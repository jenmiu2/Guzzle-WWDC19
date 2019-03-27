//
//  mutacion.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 14/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

let propabilityOfMutate = 1.0

/* This function mutate some individuals of the population depending of the probability, it can change the type of operator and the type of the terminal
 
 - Usage:
    mutate(population: [Tree])
 
 */
public func mutate(population: [Tree]) {
    
    for i in 0..<population.count {
        let random = Double.random(in: 0...1)
        //Depending of the probability it can be change
        guard random > propabilityOfMutate else {
            //Select a node
            let node = population[i].root.randomNode()
            //Generate a new node with the same height
            let newNode = TreeNode(depth: 0, maxDepth: node.height())
            //Update the node
            node.type = newNode.type
            
            return
        }
    }
}

