//
//  cruce.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 14/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation



let probabilityOfCrossing = 0.03

/* This function select diferent parent of the popultation to cross
 - Usage:
    cross(population: [Tree])
 - Parameter:
    - population: Array of Tree
 */
public func cross(population: [Tree]) {
    var selectedCrossPopulation = [Tree]()
    //select the parents of the population
    for i in 0..<population.count {
        let random = Double.random(in: 0...1)
        if random < probabilityOfCrossing {
            selectedCrossPopulation.append(population[i])
        }
    }
    
    //If the size of the parent population is not pair it remove one random element
    if selectedCrossPopulation.count % 2 != 0 {
        let random = Int.random(in: 0..<selectedCrossPopulation.count)
        selectedCrossPopulation.remove(at: random)
    }
    
    //It cross each parent of the new population
    for (parent1, parent2) in zip(selectedCrossPopulation, selectedCrossPopulation.dropFirst()) {
        cross(parent1: parent1, parent2: parent2)
    }
}

/*This function cross two individuals selecting for that random node to cross each other
 
 - Usage:
    cross(parent1: Tree, parent2: Tree)
 
 - Parameter:
     - parent1: Tree
     - parent2: Tree
- Returns: Array of Tree
 */
func cross(parent1: Tree, parent2: Tree) {
    let node1 = parent1.root.randomNode()
    let node2 = parent2.root.randomNode()
    let temp = node1.type
    node1.type = node2.type
    node2.type = temp
}

