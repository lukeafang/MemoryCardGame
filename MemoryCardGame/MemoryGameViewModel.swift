//
//  MemoryGameViewModel.swift
//  MemoryCardGame
//
//  Created by Kuochi Fang on 2/23/25.
//

import Foundation

class MemoryGameViewModel: ObservableObject {
    @Published private(set) var cards: [Card]
    private var indexOfOnlyFaceUpCard: Int?
    
    init() {
        cards = []
        restartGame()
    }
    
    func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
              !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatched else { return }
        
        if let potentialMatchIndex = indexOfOnlyFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            cards[chosenIndex].isFaceUp = true
            indexOfOnlyFaceUpCard = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            cards[chosenIndex].isFaceUp = true
            indexOfOnlyFaceUpCard = chosenIndex
        }
    }
    
    func restartGame() {
        let contents = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊"]
        cards = (contents + contents).enumerated().map { index, content in
            Card(id: index, content: content)
        }
        cards.shuffle()
        indexOfOnlyFaceUpCard = nil
    }
}
