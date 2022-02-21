//
//  File.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/20/22.
//

import Foundation

struct TMDBMovie : Codable {
    var id: Int
    var overview: String?
    var posterPath: String? 
}
