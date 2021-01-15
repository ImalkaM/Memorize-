//
//  MemoryGame.swift
//  Memorize 2nd run
//
//  Created by Imalka Muthukumara on 1/14/21.
//  Copyright © 2021 Imalka Muthukumara. All rights reserved.
//

import Foundation
//Model

//specifying card content dont care type
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card){
        print("card chosen: \(card)")
    }
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2,content: content))
            cards.append(Card(id: pairIndex*2+1,content: content))
        }
    }
    
    //
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        //dont care type card content
        var content: CardContent
    }
}
