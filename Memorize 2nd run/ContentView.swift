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
        NavigationView{
            HStack {
                ForEach(viewModel.cards){ card in
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                }
                    .aspectRatio(2/3, contentMode: .fit) //assignment 1 task 3
            }
            .padding()
            .foregroundColor(Color.orange)
                .font(viewModel.cards.count < 4 ? Font.largeTitle : Font.title) //assignment 1 task 5
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
