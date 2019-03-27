//
//  evaluacion.swift
//  proyectoWWDC19
//
//  Created by Jennifer on 22/03/2019.
//  Copyright © 2019 Jennifer. All rights reserved.
//

import Foundation


/*This function evaluates an individual on the map, for this we calculate what the individual eats in a given time
 
 - Usage:
    evaluation(individual: Tree)
 
 - Parameter:
     - individual: Tree
 */
public func evaluation(individual: Tree, mapToEvaluate: Map) -> Map {
    var mapCopy = mapToEvaluate
    
    //executing the loop to check how much it eats
    while mapCopy.steps < 400 && mapCopy.morsel < 20 {
        mapCopy.execute(node: individual.root)
    }
    //The adaptation will be what the individual has eaten on the time that is left over
    individual.adaptation = mapCopy.morsel + 400 - mapCopy.steps
    return mapCopy
}
