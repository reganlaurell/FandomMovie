//
//  MovieViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/13/22.
//

import Foundation

class MovieListViewModel {
    var fandom: Fandom
    var series: [JsonMovie]
    
    var releaseSortedSeries: [JsonMovie] = []
    var chronologicallySortedSeries: [JsonMovie] = []
    
    init(fandom: Fandom) {
        self.fandom = fandom
        self.series = []
        getMovies()
    }
    
    private func getMovies() {
        getJsonMovies(jsonPath: fandom.getJsonFilePath(fandom: fandom))
        sortMovies()
    }
    
    private func sortMovies() {
        releaseSortedSeries = series.sorted {
            $0.releaseId ?? 999 < $1.releaseId ?? 999
        }
        
        chronologicallySortedSeries = series.sorted {
            $0.chronologicalId ?? 999 < $1.chronologicalId ?? 999
        }
    }
    
    private func getJsonMovies(jsonPath: String) {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/\(jsonPath).json") {
            do {
                let data = try Data(contentsOf: url)
                self.series = parse(json: data)
            } catch {
                print("Data error: \(error)")
            }
        }
    }
    
    private func parse(json: Data) -> [JsonMovie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let jsonMovies = try decoder.decode(Series.self, from: json)
            return jsonMovies.series ?? []
        } catch {
            print("Decoder error: \(error)")
            return []
        }
       
    }
}
