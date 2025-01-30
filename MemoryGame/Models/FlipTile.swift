//
//  FlipTile.swift
//  MemoryGame
//
//  Created by Sergey Dubrovin on 28.01.2025.
//

import SwiftUI

extension GameView {
    
    func flipTile(_ index: Int) {
        
        let difficulty = tiles.currentLevel + 1
        
        guard !tiles.arrayTiles[index].isFlipped else { return }
        guard flippedTiles.count <= difficulty else { return }
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.4))  {
            tiles.arrayTiles[index].isFlipped.toggle()
            gameCounts += 1
        }
        flippedTiles.append(tiles.arrayTiles[index])
        if flippedTiles.count == difficulty {
            checkForMatch()
        }
    }
}

extension GameView {
    
    func checkForMatch() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            
            if let firstColor = flippedTiles.first?.color, flippedTiles.allSatisfy({ $0.color == firstColor }){
                flippedTiles.removeAll()
                checkGameOver()
            } else {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.4))  {
                    for tile in flippedTiles {
                        let index = tiles.arrayTiles.firstIndex(where: {$0.id == tile.id})!
                        tiles.arrayTiles[index].isFlipped.toggle()
                    }
                }
                flippedTiles.removeAll()
            }
        }
    }
}

extension GameView {
    
    func checkGameOver() {
        if tiles.arrayTiles.allSatisfy(\.isFlipped) {
            gameComplete = true
        }
    }
}
