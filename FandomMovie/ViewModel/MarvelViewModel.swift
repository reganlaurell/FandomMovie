//
//  MarvelViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import Foundation
import SwiftUI

class MarvelViewModel {
    var marvelSeries = [MarvelMovie]()
    
    init() {
        marvelSeries = getMovies()
    }
    
    func getMovies() -> [MarvelMovie] {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/marvel.json") {
            if let data = try? Data(contentsOf: url) {
                return parse(json: data)
            }
        }
        return []
    }
    
    func sortReleaseOrder() -> [MarvelMovie] {
        marvelSeries.sorted {
            $0.movieId < $1.movieId
        }
    }
    
    func sortChronologically() -> [MarvelMovie] {
        marvelSeries.sorted {
            $0.chronologicalId ?? 999 < $1.chronologicalId ?? 999
        }
    }
    
    private func parse(json: Data) -> [MarvelMovie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let jsonMovies = try? decoder.decode(MarvelSeries.self, from: json) {
            return jsonMovies.series ?? []
        }
        
        return []
    }
}
