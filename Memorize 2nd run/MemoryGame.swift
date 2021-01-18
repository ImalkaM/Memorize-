//
//  MemoryGame.swift
//  Memorize 2nd run
//
//  Created by Imalka Muthukumara on 1/14/21.
//  Copyright © 2021 Imalka Muthukumara. All rights reserved.
//

import Foundation
//Model

//specifying card content dont care type not
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        
    }
    
    //finding the index of chosen card
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 //TODO: bogus!
    }
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<Int.random(in:5...numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2,content: content))
            cards.append(Card(id: pairIndex*2+1,content: content))
        }
        cards.shuffle() //assignment 1 cards suffling task
    }
    
    //
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        //dont care type card content
        var content: CardContent
        
    }
}
