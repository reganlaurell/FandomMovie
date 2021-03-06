//
//  Fandom.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/21/22.
//

import Foundation

enum Fandom: String {
    case marvel
    case harryPotter
    case starWars
    case pixar
}

extension Fandom {
    func getJsonFilePath(fandom: Fandom) -> String {
        switch(fandom) {
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
    
    func getDisplayString(fandom: Fandom) -> String {
        switch(fandom) {
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
