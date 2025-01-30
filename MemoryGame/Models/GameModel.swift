//
//  GameModel.swift
//  MemoryGame
//
//  Created by Sergey Dubrovin on 28.01.2025.
//

import Foundation
import SwiftUI

struct Tile: Identifiable {
    let id = UUID()
    var color: Color
    var isFlipped: Bool = false
    
    init(color: Color) {
        self.color = color
    }
}

struct Tiles {
    var arrayTiles: [Tile] = []
    let colorSetOne: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]
    let colorSetTwo: [Color] = [.red, .blue, .green, .yellow, .orange, .purple, .pink, .brown]
    let colorSetThree: [Color] = [.red, .blue, .green, .yellow, .purple, .pink]
    
    var currentLevel: Int = 1
    
    init() {
        newLevel(level: currentLevel)
    }
    
    mutating func newLevel(level: Int) {
        switch level {
        case 1:
            arrayTiles.removeAll()
            for color in colorSetOne {
                for _ in 0..<4 {
                    arrayTiles.append(Tile(color: color))
                }
            }
            arrayTiles.shuffle()
        case 2:
            arrayTiles.removeAll()
            for color in colorSetTwo {
                for _ in 0..<3 {
                    arrayTiles.append(Tile(color: color))
                }
            }
            arrayTiles.shuffle()
        case 3:
            arrayTiles.removeAll()
            for color in colorSetThree {
                for _ in 0..<4 {
                    arrayTiles.append(Tile(color: color))
                }
            }
            arrayTiles.shuffle()
        default:
            arrayTiles.removeAll()
            for color in colorSetOne {
                for _ in 0..<4 {
                    arrayTiles.append(Tile(color: color))
                }
            }
            arrayTiles.shuffle()
        }
    }
}


