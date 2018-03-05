//
//  Concentration.swift
//  memory-game
//
//  Created by Manoj Ashok Kurien on 17/02/2018.
//  Copyright © 2018 Manoj Ashok Kurien. All rights reserved.
//

import Foundation

import Foundation

class Concentration {
    
    var allMatched = false
    var numberOfMatchedCards = 0

    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier ==  cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    numberOfMatchedCards += 1
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                // no cards face up or 2 cards face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        allMatched = false
        
        for _ in 1...20 {
            let position1 = Int(arc4random_uniform(UInt32(cards.count)))
            let position2 = Int(arc4random_uniform(UInt32(cards.count)))
            swapCards(a: position1, b: position2)
        }
        
    }
    
    private func swapCards(a: Int, b: Int){
        let holdingCard = cards[a]
        cards[a] = cards[b]
        cards[b] = holdingCard
    }
    
    func isGameOver() -> Bool{
        return numberOfMatchedCards == (cards.count/2)
    }
    
}
