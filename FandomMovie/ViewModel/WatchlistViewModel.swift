//
//  WatchlistViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/13/22.
//

import Foundation

enum Fandom {
    case harryPotter
    case marvel
}

class WatchlistViewModel {
    var fandoms: [Fandom] = [.harryPotter, .marvel]
}
