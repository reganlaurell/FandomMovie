//
//  MovieViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/13/22.
//

import Foundation

class MovieViewModel {
    var fandom: Fandom
    var series = [FandomMovie]()
    
    private var jsonMovieSeries = [Movie]()
    private var tmdbMovieSeries = [TMDBMovie]()
    
    init(fandom: Fandom) {
        self.fandom = fandom
        getMovies()
    }
    
    func getMovies() {
        getJsonMovies(fandom: fandom.rawValue)
        getTmdbMovies()
        
        for (index, movie) in jsonMovieSeries.enumerated() {
            series.append(
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
        series.sorted {
            $0.releaseId ?? 999 < $1.releaseId ?? 999
        }
    }
    
    func sortChronologically() -> [FandomMovie] {
        series.sorted {
            $0.chronologicalId ?? 999 < $1.chronologicalId ?? 999
        }
    }
    
    private func getJsonMovies(fandom: String) {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/\(fandom).json") {
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
