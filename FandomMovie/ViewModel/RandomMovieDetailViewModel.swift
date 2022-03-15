//
//  RandomMovieDetailViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 3/13/22.
//

import Foundation

class RandomMovieDetailViewModel {
    let randomMovie: TmdbMovie
    
    private let movieService = MovieDBService()
    
    init(movieId: Int) {
        self.randomMovie = movieService.getTMDBMovie(id: movieId)
    }
    
    func getImageUrl() -> String? {
        if let path = randomMovie.posterPath {
            return movieService.getImageUrl(imagePath: path)
        }
        
        return nil
    }
}
