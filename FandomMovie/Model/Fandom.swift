//
//  Fandom.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/21/22.
//

import Foundation

enum Fandom: String, CaseIterable, Identifiable {
    case marvel
    case harryPotter
    case starWars
    case pixar
    
    var id: String { self.rawValue }
    
    var jsonFilePath: String {
        switch self {
        case .marvel:
            return "marvel"
        case .harryPotter:
            return "harry-potter"
        case .starWars:
            return "star-wars"
        case .pixar:
            return "pixar"
        }
    }
    
    var displayString: String {
        switch self {
        case .marvel:
            return "Marvel"
        case .harryPotter:
            return "Harry Potter"
        case .starWars:
            return "Star Wars"
        case .pixar:
            return "Pixar"
        }
    }
}
