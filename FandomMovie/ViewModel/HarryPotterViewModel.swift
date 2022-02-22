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
    private var tmdbMovieSeries = [TMDBMovie]()
    
    init() {
        getMovies()
    }
    
    func getMovies() {
        getJsonMovies()
        getTmdbMovies()
        
        for (index, movie) in jsonMovieSeries.enumerated() {
            hpSeries.append(
                FandomMovie(
                    jsonMovie: movie,
                    tmdbMovie: tmdbMovieSeries[index],
                    imageUrl: getMovieImage(posterPath: tmdbMovieSeries[index].posterPath ?? nil)
                )
            )
        }
    }
    
    func getMovieImage(posterPath: String?) -> String? {
        if let path = posterPath {
            return MovieDBService().getImageUrl(imagePath: path)
        }
        
        return nil
    }
    
    func sortReleaseOrder() -> [FandomMovie] {
        hpSeries.sorted {
            $0.releaseId ?? 999 < $1.releaseId ?? 999
        }
    }
    
    func sortChronologically() -> [FandomMovie] {
        hpSeries.sorted {
            $0.chronologicalId ?? 999 < $1.chronologicalId ?? 999
        }
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
    
    private func getTmdbMovies() {
        for movie in jsonMovieSeries {
            tmdbMovieSeries.append(MovieDBService().getTMDBMovie(id: movie.movieId))
        }
    }
}
