//
//  TailView.swift
//  MemoryGame
//
//  Created by Sergey Dubrovin on 28.01.2025.
//

import SwiftUI

struct TailView: View {
    
    @Binding var tile: Tile
    var size: CGFloat
    var onFlip: () -> Void
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(color4)
                .frame(width: size, height: size)
                .cornerRadius(10)
                .scaleEffect(tile.isFlipped ? 0 : 1)
                .opacity(tile.isFlipped ? 0 : 1)
                .onTapGesture {
                    onFlip()
                }
            
            Rectangle()
                .fill(tile.color)
                .frame(width: size, height: size)
                .cornerRadius(10)
                .scaleEffect(tile.isFlipped ? 1 : 0)
                .opacity(tile.isFlipped ? 1 : 0)
                .onTapGesture {
                    onFlip()
                }
            
//            Image("tile") // Показываем изображение
//                .resizable()
//                .scaledToFit()
//                .frame(width: size, height: size)
//                .cornerRadius(10)
//                .scaleEffect(!tile.isFlipped ? 0 : 1)
//                .onTapGesture {
//                    onFlip()
//                }
        }
    }
}
