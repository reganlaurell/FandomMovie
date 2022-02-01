//
//  MarvelMovie.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import Foundation

class MarvelMovie : Codable, Identifiable {
    var id: Int
    var title: String?
    var movieId: Int?
    var phase: String?
    var releaseYear: Int?
    var runningTime: Int?
    var rating: String?
    var releaseDate: String?
}
