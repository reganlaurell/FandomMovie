//
//  MovieDetailViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 3/5/22.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movieInformation: MovieInformation
    
    init(from jsonMovie: JsonMovie) {
        self.movieInformation = MovieInformation(jsonMovie: jsonMovie)
        self.movieInformation = movieInformation.setTmdbMovieInfo(
            movieInfo: movieInformation,
            tmdbMovie: getTmdbMovie(from: movieInformation.id)
        )
    }
    
    func getImageUrl() -> String? {
        if let path = movieInformation.posterPath {
            return MovieDBService().getImageUrl(imagePath: path)
        }
        
        return nil
    }
    
    private func getTmdbMovie(from movieId: Int) -> TmdbMovie {
        return MovieDBService().getTMDBMovie(id: movieId) ?? TmdbMovie(id: movieId, overview: nil, posterPath: nil)
    }
}
