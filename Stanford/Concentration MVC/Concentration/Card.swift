//
//  Card.swift
//  Concentration
//
//  Created by Harsh Khajuria on 21/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
//        self.identifier = identifier
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
