//
//  ArrayExtensions.swift
//  monty
//
//  Created by Pierre-Marie Galite on 28/12/16.
//  Copyright © 2016 Pierre-Marie Galite. All rights reserved.
//

import Foundation

extension Array {
    
    func shuffled() -> Array<Element> {
        var indexArray = Array<Int>(indices)
        var index = indexArray.endIndex
        
        let indexIterator = AnyIterator<Int> {
            guard let nextIndex = indexArray.index(index, offsetBy: -1, limitedBy: indexArray.startIndex)
                else { return nil }
            
            index = nextIndex
            let randomIndex = Int(arc4random_uniform(UInt32(index)))
            if randomIndex != index {
                swap(&indexArray[randomIndex], &indexArray[index])
            }
            
            return indexArray[index]
        }
        
        return indexIterator.map { self[$0] }
    }
    
}
