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
