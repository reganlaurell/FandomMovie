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
    var runtime: Int?
    
    func getruntime() -> String {
        var hours : Int
        var mins : Int
        
        guard let runtime = self.runtime else {
            return "Coming Soon"
        }
        
        if runtime == 0 {
            return "Coming Soon"
        } else if (runtime > 60) {
            hours = runtime / 60
            mins = runtime % 60
            return "\(hours) hr \(mins) min"
        } else {
            return "\(runtime)min"
        }
    }
}
