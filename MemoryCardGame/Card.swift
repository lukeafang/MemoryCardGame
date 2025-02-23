//
//  Card.swift
//  MemoryCardGame
//
//  Created by Kuochi Fang on 2/23/25.
//

import Foundation

struct Card: Identifiable {
    let id: Int
    let content: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
}
