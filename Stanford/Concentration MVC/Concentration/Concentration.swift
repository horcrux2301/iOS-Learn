//
//  Concentration.swift
//  Concentration
//
//  Created by Harsh Khajuria on 21/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import Foundation

class Concetration
{
    // var card = Array<Card>()
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index:Int){
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no or 2 cards match
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards:Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
            // let matchingCard = card
            // cards.append(card)
            // cards.append(card)
        }
        // TODO: Shuffle the cards
    }
}
