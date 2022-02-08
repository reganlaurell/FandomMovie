//
//  Marvel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/1/22.
//

import Foundation

struct MarvelSeries : Codable {
    var series : [MarvelMovie]?
}

struct MarvelMovie : Hashable, Codable {
    var movieId: Int
    var chronologicalId: Int?
    var title: String
    var phase: String
    var releaseYear: Int
    var runningTime: Int
    var ratingName: String
    var releaseDate: String
}
