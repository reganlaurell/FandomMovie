//
//  MovieViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/13/22.
//

import Foundation

class MovieListViewModel {
    var fandom: Fandom
    var series: Series?
    
    var releaseSortedSeries: [JsonMovie] = []
    var chronologicallySortedSeries: [JsonMovie] = []
    
    init(fandom: Fandom) {
        self.fandom = fandom
        getMovies()
    }
    
    private func getMovies() {
        getJsonMovies(jsonPath: fandom.getJsonFilePath(fandom: fandom))
        sortMovies()
    }
    
    private func sortMovies() {
        guard let movies = series?.series else { print("Sort Movie error"); return }
        releaseSortedSeries = movies.sorted {
            $0.releaseId ?? 999 < $1.releaseId ?? 999
        }
        
        chronologicallySortedSeries = movies.sorted {
            $0.chronologicalId ?? 999 < $1.chronologicalId ?? 999
        }
    }
    
    private func getJsonMovies(jsonPath: String) {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/\(jsonPath).json") {
            self.series = JsonParseUtility.decodeJson(url: url)
        }
    }
}
