//
//  EmojiMemoryGameView.swift
//  Memorize 2nd run
//
//  Created by Imalka Muthukumara on 1/13/21.
//  Copyright © 2021 Imalka Muthukumara. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    
    var body: some View {
        NavigationView{
            HStack {
                ForEach(viewModel.cards){ card in
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                        .aspectRatio(2/3, contentMode: .fit) //assignment 1 task 3
                }
                
            }
            .padding()
            .foregroundColor(Color.orange)
            
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
//card content
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
        
    }
    // seprate function body to avoid typing .self in every drawing constants
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
                
            }else{
                RoundedRectangle(cornerRadius: 10).fill()
                
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    //MARK: drawing constants
    
    let cornerRadius:CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
