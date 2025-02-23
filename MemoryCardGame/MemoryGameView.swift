//
//  MemoryGameView.swift
//  MemoryCardGame
//
//  Created by Kuochi Fang on 2/23/25.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel = MemoryGameViewModel()
    
    let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .padding()
            
            Button(action: {
                viewModel.restartGame()
            }) {
                Text("Restart Game")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    MemoryGameView()
}
