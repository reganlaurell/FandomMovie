//
//  FandomMovie.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/20/22.
//

import Foundation

struct FandomMovie : Hashable, Codable {
    var id: Int
    var releaseId: Int?
    var chronologicalId: Int?
    var title: String
    var releaseYear: Int
    var releaseDate: String
    var runningTime: String
    var ratingName: String
    var phase: String?
    var overview: String?
    var imageUrl: String?
    
    init(jsonMovie: Movie, tmdbMovie: TMDBMovie, imageUrl: String?) {
        self.id = jsonMovie.movieId
        self.releaseId = jsonMovie.releaseId
        self.chronologicalId = jsonMovie.chronologicalId
        self.title = jsonMovie.title
        self.releaseYear = jsonMovie.releaseYear
        self.releaseDate = jsonMovie.releaseDate
        self.runningTime = jsonMovie.getRunningTime()
        self.ratingName = jsonMovie.ratingName
        self.phase = jsonMovie.phase
        self.overview = tmdbMovie.overview
        self.imageUrl = imageUrl
    }
}
