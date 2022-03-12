//
//  Movie.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/1/22.
//

import Foundation

struct Series: Codable {
    var series: [JsonMovie]?
}

struct JsonMovie : Hashable, Codable {
    var movieId: Int
    var title: String
    var releaseYear: Int
    var runningTime: Int
    var ratingName: String?
    var releaseDate: String
    var phase: String?
    var releaseId: Int?
    var chronologicalId: Int?
}
