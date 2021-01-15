//
//  EmojiMemoryGame.swift
//  Memorize 2nd run
//
//  Created by Imalka Muthukumara on 1/14/21.
//  Copyright © 2021 Imalka Muthukumara. All rights reserved.
//

import Foundation
import SwiftUI

//ViewModel
class EmojiMemoryGame {
    
    //accessing model var
    //set keyword means views can see the model but only viewmodel can write
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    //creating cardsgame
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count){ pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //MARK: - Acess to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards.shuffled()
    }
    
    //MARK: Intent
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}


