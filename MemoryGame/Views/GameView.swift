//
//  ContentView.swift
//  MemoryGame
//
//  Created by Sergey Dubrovin on 28.01.2025.
//
import SwiftUI

struct GameView: View {
    
    @State var gameComplete: Bool = false
    @State var levelSelect: Bool = false
    @State private var isPressed = false
    @State var tiles = Tiles()
    @State var flippedTiles: [Tile] = []
    @State var gameCounts: Int = 0
    
    var body: some View {
        
        GeometryReader { geometry in
            let tileSize = geometry.size.width / CGFloat(4) - 15
            
            ZStack {
                
                RadialGradient(gradient: Gradient(colors: [color1, color2]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 500)
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("Память")
                        .font(.system(size: 70))
                        .foregroundStyle(color4)
                        .font(.largeTitle)
                    if tiles.currentLevel == 1{
                        Text("Обычная сложность")
                            .foregroundStyle(color3)
                    } else if tiles.currentLevel == 2{
                        Text("Повышенная сложность")
                            .foregroundStyle(.gray)
                    } else {
                        Text("Экстримальный режим")
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    ForEach(0..<tiles.arrayTiles.count / 4, id: \.self) { row in
                        HStack {
                            ForEach(0..<4, id: \.self) { col in
                                let index = row * 4 + col
                                TailView(tile: $tiles.arrayTiles[index], size: tileSize, onFlip: {flipTile(index)})
                            }
                        }
                        
                    }
                    Spacer()
                    HStack{
                        Button("Выбрать сложность"){
                            levelSelect = true
                        }
                        .padding(20)
                        .background(color2)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(20)
                        
                        Spacer()
                        Button("Сброс"){
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.4))  {
                                tiles.newLevel(level: tiles.currentLevel)
                                gameCounts = 0
                                gameComplete = false
                            }
                        }
                        .padding(20)
                        .background(color2)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(20)
                    }
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 10)
            }
        }
        .alert("Вы выиграли!", isPresented: $gameComplete) {
            Button("OK", role: .cancel){
                withAnimation(.spring(response: 0.4, dampingFraction: 0.4))  {
                    tiles.newLevel(level: tiles.currentLevel)
                    gameCounts = 0
                    gameComplete = false
                }
            }
        } message: {
            Text("Таблица открыта за \(gameCounts) ходов")
        }
        
        .alert("Выберите уровень", isPresented: $levelSelect) {
            Button("Обычный, 2 одинаковых тайла") {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.4))  {
                    tiles.currentLevel = 1
                    tiles.newLevel(level: tiles.currentLevel)
                    gameCounts = 0
                    gameComplete = false}
            }
            Button("Трудный, 3 одинаковых тайла") {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.4))  {
                    tiles.currentLevel = 2
                    tiles.newLevel(level: tiles.currentLevel)
                    gameCounts = 0
                    gameComplete = false}
            }
            Button("Эксперт, 4 одинаковых тайла") {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.4))  {
                    tiles.currentLevel = 3
                    tiles.newLevel(level: tiles.currentLevel)
                    gameCounts = 0
                    gameComplete = false}
            }
            Button("Отмена", role: .cancel) {}
        }
        
        
        
    }
    
}

#Preview {
    GameView()
}


