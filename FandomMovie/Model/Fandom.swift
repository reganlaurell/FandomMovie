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
}

extension Fandom {
    func getJsonFilePath(fandom: Fandom) -> String {
        switch(fandom) {
        case .marvel:
            return "marvel"
        case .harryPotter:
            return "harry-potter"
        }
    }
    
    func getDisplayString(fandom: Fandom) -> String {
        switch(fandom) {
        case .marvel:
            return "Marvel"
        case .harryPotter:
            return "Harry Potter"
        }
    }
}
