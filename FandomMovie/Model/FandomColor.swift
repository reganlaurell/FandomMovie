//
//  FandomColor.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/12/22.
//

import SwiftUI

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

enum FandomColor {
    static let marvel = Gradient(colors: [.red, .white, .red, .white, .red])
    static let harryPotter = Gradient(colors: [
        .black, Color(0x740001),Color(0xD3A625),  // Gryffindor
        .black, Color(0x1A472A), Color(0x5D5D5D), // Slytherin
        .black, Color(0xFFD800),                  // Hufflepuff
        .black, Color(0x0E1A40), Color(0x946B2D), // Ravenclaw
        .black
    ])
}

