//
//  MarvelViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import Foundation

class MarvelViewModel : MovieViewModel {
    var marvelSeries = [Movie]()
    
    init() {
        getMovies()
    }
    
    func getMovies() {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/marvel.json") {
            if let data = try? Data(contentsOf: url) {
                marvelSeries = parse(json: data)
            }
        }
    }
    
    func sortReleaseOrder() -> [Movie] {
        marvelSeries.sorted {
            $0.movieId < $1.movieId
        }
    }
    
    func sortChronologically() -> [Movie] {
        marvelSeries.sorted {
            $0.chronologicalId ?? 999 < $1.chronologicalId ?? 999
        }
    }
    
    private func parse(json: Data) -> [Movie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let jsonMovies = try? decoder.decode(Series.self, from: json) {
            return jsonMovies.series ?? []
        }
        
        return []
    }
}
