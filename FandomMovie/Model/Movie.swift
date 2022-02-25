//
//  Movie.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/1/22.
//

import Foundation

struct Series: Codable {
    var series: [Movie]?
}

struct Movie : Hashable, Codable {
    var movieId: Int
    var title: String
    var releaseYear: Int
    var runningTime: Int
    var ratingName: String
    var releaseDate: String
    var phase: String?
    var releaseId: Int?
    var chronologicalId: Int?
}

extension Movie {
    func getRunningTime() -> String {
        var hours : Int
        var mins : Int
        
        if runningTime == 0 {
            return "Coming Soon"
        } else if (self.runningTime > 60) {
            hours = self.runningTime / 60
            mins = self.runningTime % 60
            return "\(hours) hr \(mins) min"
        } else {
            return "\(self.runningTime)min"
        }
    }
}
