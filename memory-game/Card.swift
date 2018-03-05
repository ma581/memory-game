//
//  Card.swift
//  memory-game
//
//  Created by Manoj Ashok Kurien on 17/02/2018.
//  Copyright © 2018 Manoj Ashok Kurien. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var identifier: Int
    var isMatched = false

    init() {
        self.identifier = Card.getIdentifier()
    }
    
    static var identifierFactory = 0
    
    static func getIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
