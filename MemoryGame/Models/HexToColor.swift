//
//  HexToColor.swift
//  MemoryGame
//
//  Created by Sergey Dubrovin on 30.01.2025.
//

import SwiftUI

extension Color {
    init?(hex: String) {
        
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        guard hexSanitized.count == 6 || hexSanitized.count == 8 else {
            return nil
        }

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        let alpha: Double
        if hexSanitized.count == 8 {
            alpha = Double((rgb >> 24) & 0xFF) / 255.0
        } else {
            alpha = 1.0
        }

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

let color1 = Color(hex: "#181722") ?? Color.red
let color2 = Color(hex: "#393F4A") ?? Color.red
let color3 = Color(hex: "#DCD2CC") ?? Color.red
let color4 = Color(hex: "#EBEBEB") ?? Color.red
let color5 = Color(hex: "#8A7875") ?? Color.red
