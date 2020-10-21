//
//  Card.swift
//  Concentration
//
//  Created by Rafael Nunes Rios on 10/8/20.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdenfier() -> Int {
        identifierFactory += 1
        
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdenfier()
    }
    
}
