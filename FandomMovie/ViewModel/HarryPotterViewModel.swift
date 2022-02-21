//
//  HarryPotterViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/13/22.
//

import Foundation

class HarryPotterViewModel: MovieViewModel {
    var hpSeries = [FandomMovie]()
    
    private var jsonMovieSeries = [Movie]()
    private var tmdbMovieSeries = [TMDBMovie?]()
    
    
    init() {
        getMovies()
    }
    
    func getMovies() {
        
    }
    
    func getMovieImage() {
        
    }
    
    private func getJsonMovies() {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/harry-potter.json") {
            if let data = try? Data(contentsOf: url) {
                jsonMovieSeries = parse(json: data)
            }
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
