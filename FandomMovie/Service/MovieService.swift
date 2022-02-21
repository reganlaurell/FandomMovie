//
//  TMDBService.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/20/22.
//

import Foundation

protocol TMDBService {
    var apiKey : String { get }
}

extension TMDBService {
    var apiKey: String {
      get {
        guard let filePath = Bundle.main.path(forResource: "TMDB-Info", ofType: "plist") else {
          fatalError("Couldn't find file 'TMDB-Info.plist'.")
        }
          
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'TMDB-Info.plist'.")
        }
        
        if (value.starts(with: "_")) {
          fatalError("Register for a TMDB developer account and get an API key at https://developers.themoviedb.org/3/getting-started/introduction.")
        }
        return value
      }
    }
}

class MovieDBService : TMDBService {
    
    func getTMDBMovie(id: Int) -> TMDBMovie? {
        if let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKey)") {
            if let data = try? Data(contentsOf: url) {
                return parse(json: data)
            }
        }
        print("TMDB Service: Movie not found")
        return nil
    }
    
    func getImageUrl(imagePath: String) -> String {
        return "https://image.tmdb.org/t/p/original\(imagePath)"
    }
    
    private func parse(json: Data) -> TMDBMovie? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let tmdbMovie = try? decoder.decode(TMDBMovie.self, from: json) {
            return tmdbMovie
        }
        
        return nil
    }
}
