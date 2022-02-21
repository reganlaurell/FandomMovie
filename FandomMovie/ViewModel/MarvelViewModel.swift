//
//  MarvelViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import Foundation

class MarvelViewModel : MovieViewModel {
    var marvelSeries = [FandomMovie]()
    
    private var jsonMovieSeries = [Movie]()
    private var tmdbMovieSeries = [TMDBMovie?]()
    
    init() {
        getMovies()
    }
    
    func getMovies() {
        for movie in jsonMovieSeries {
            // create a FandomMovie from json movie and tmdb movie
        }
    }
    
    func getMovieImage() {
        
    }
    
    func sortReleaseOrder() -> [FandomMovie] {
        marvelSeries.sorted {
            $0.releaseId ?? 999 < $1.releaseId ?? 999
        }
    }
    
    func sortChronologically() -> [FandomMovie] {
        marvelSeries.sorted {
            $0.chronologicalId ?? 999 < $1.chronologicalId ?? 999
        }
    }
    
    private func getJsonMovies() {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/marvel.json") {
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
    
    private func getTmdbMovies() {
        for movie in jsonMovieSeries {
            tmdbMovieSeries.append(MovieDBService().getTMDBMovie(id: movie.movieId) ?? nil)
        }
    }
}
