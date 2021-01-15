//
//  ContentView.swift
//  Memorize 2nd run
//
//  Created by Imalka Muthukumara on 1/13/21.
//  Copyright © 2021 Imalka Muthukumara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel:EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)  
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}
//card content
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
                
            }else{
                RoundedRectangle(cornerRadius: 10).fill()
                
            }
        }
    }
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
