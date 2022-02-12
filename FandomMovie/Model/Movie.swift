//
//  Movie.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/1/22.
//

import Foundation

protocol Movie : Codable {
    var movieId: Int { get }
    var title: String { get }
    var releaseYear: Int { get }
    var runningTime: Int { get }
    var ratingName: String { get }
    var releaseDate: String { get }
}

extension Movie {
    func getRunningTime() -> String {
        var hours : Int
        var mins : Int
        if (self.runningTime > 60) {
            hours = self.runningTime / 60
            mins = self.runningTime % 60
            return "\(hours) hr \(mins) min"
        } else {
            return "\(self.runningTime)min"
        }
    }
}
