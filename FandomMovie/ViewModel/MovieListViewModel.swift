//
//  MovieViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/13/22.
//

import Foundation

class MovieListViewModel {
    var fandom: Fandom
    var series = [JsonMovie]()
    
    init(fandom: Fandom) {
        self.fandom = fandom
        getMovies()
    }
    
    func sortReleaseOrder() -> [JsonMovie] {
        series.sorted {
            $0.releaseId ?? 999 < $1.releaseId ?? 999
        }
    }
    
    func sortChronologically() -> [JsonMovie] {
        series.sorted {
            $0.chronologicalId ?? 999 < $1.chronologicalId ?? 999
        }
    }
    
    private func getMovies() {
        getJsonMovies(jsonPath: fandom.getJsonFilePath(fandom: fandom))
    }
    
    private func getJsonMovies(jsonPath: String) {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/\(jsonPath).json") {
            if let data = try? Data(contentsOf: url) {
                series = parse(json: data)
            }
        }
    }
    
    private func parse(json: Data) -> [JsonMovie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let jsonMovies = try? decoder.decode(Series.self, from: json) {
            return jsonMovies.series ?? []
        }
        
        return []
    }
}
