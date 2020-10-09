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
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
}
