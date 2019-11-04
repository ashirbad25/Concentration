//
//  Concentration.swift
//  Concentration
//
//  Created by Aashirwad Sinha on 10/21/19.
//  Copyright © 2019 Credit Suisse. All rights reserved.
//

import Foundation

struct Concentration {
    var cards = [Card]()
    private var indexOfOneAndOnlyOneFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter() {
                cards[$0].isFaceUp
            }.oneAndOnly
            
            return faceUpCardIndices
            
//            let faceUpCardIndices = cards.indices.filter() {
//                cards[$0].isFaceUp
//            }
//
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
            
//            var foundIndex: Int?
//
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyOneFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): You must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            
            cards += [card, card]
        }
        
        //TODO: Shuffle the cards
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

