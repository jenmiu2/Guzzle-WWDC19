//
//  Truncamiento.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 22/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation

/* This function selects the best individuals of the population using a percentage to calculate the size
 - Warning: numberOfElement and maxDepth more than 1
 
 - Usage:
    selectionByTruncation(population: [Tree])
 
 - Parameter:
     - population: Array of Tree
 - Returns: Array of Tree
 */
public func selectionByTruncation(population: inout [Tree]) -> [Tree] {
    //Choose the size of the selected population
    let truncate = Int(Double(population.count) * 1)
    var i = 0
    var selectedPopulation = [Tree]()
    
    //sort the parameterized array
    population.sort(by: {$0.adaptation > $1.adaptation})
    
    //fill the new array
    while selectedPopulation.count < population.count {
        while  i < truncate && selectedPopulation.count < population.count {
            selectedPopulation.append(population[i])
            i+=1
        }
    }
    return selectedPopulation
}
