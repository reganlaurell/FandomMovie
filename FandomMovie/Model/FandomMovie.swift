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
    var status: String?
    var imageUrl: String?
    
    init(jsonMovie: Movie, tmdbMovie: TMDBMovie, imageUrl: String?) {
        self.id = jsonMovie.movieId
        self.releaseId = jsonMovie.releaseId
        self.chronologicalId = jsonMovie.chronologicalId
        self.title = jsonMovie.title
        self.releaseYear = jsonMovie.releaseYear
        self.releaseDate = jsonMovie.releaseDate
        self.ratingName = jsonMovie.ratingName
        self.phase = jsonMovie.phase
        
        self.runningTime = tmdbMovie.getRuntime()
        self.overview = tmdbMovie.overview
        self.status = tmdbMovie.status
        
        self.imageUrl = imageUrl
    }
}

extension FandomMovie {
    func formatOrderId(id: Int) -> String {
        let lastDigit = String(id).suffix(1)
        var suffix = ""
        
        switch(lastDigit) {
        case "1":
            suffix = "st"
        case "2":
            suffix = "nd"
        case "3":
            suffix = "rd"
        case "0", "4", "5", "6", "7", "8", "9":
            suffix = "th"
        default:
            print("unknown number")
        }
        return "\(id)\(suffix)"
    }
}
