//
//  Card.swift
//  Concentration
//
//  Created by Aashirwad Sinha on 10/21/19.
//  Copyright © 2019 Credit Suisse. All rights reserved.
//

import Foundation

struct Card : Hashable {
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
